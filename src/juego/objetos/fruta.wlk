import wollok.game.*
import juego.sonidos.*
import juego.posicionadores.posicionadorFruta
import juego.objetos.posicionables.Consumible
import juego.objetos.fireBall.FireBall
import juego.objetos.orbesPuntos.Orbe

class Fruta inherits Consumible {

	const posicionador = posicionadorFruta
	var cooldown = 0

	method image() = "frutas/" + nombre + ".png"

	method jugando() = true

	method tieneVidas() = true

	method puedeSerComidoPor(unPersonaje) = true

	method efectoPara(unPersonaje) {
	}

	method inicializar() {
		carcel = game.at(23, 13)
		position = carcel
		game.addVisual(self)
	}

	method encarcelar() {
		position = carcel
	}

	method serComidoPor(unPersonaje) {
		sonidos.reproducir("comer.mp3")
		unPersonaje.sumarPuntos(puntos)
		new Orbe(puntos = puntos, position = position).mostrarse()
		position = carcel
		self.efectoPara(unPersonaje)
		game.schedule(cooldown, { self.aparecer()})
	}

	method interactuarCon(unPersonaje) {
		self.serComidoPor(unPersonaje)
	}

	method aparecer() {
		posicionador.randomPosPara(self)
	}

}

class Coin inherits Fruta {

	method iniciar() {
		nombre = "coin"
		cooldown = 5000
		puntos = 25
		self.inicializar()
	}

}

class Banana inherits Fruta {

	method iniciar() {
		nombre = "banana"
		cooldown = 25000
		puntos = 50
		self.inicializar()
	}

	override method efectoPara(unPersonaje) {
		unPersonaje.enfurecerPor(10000)
	}

}

class Cherry inherits Fruta {

	method iniciar() {
		nombre = "cherry"
		cooldown = 15000
		puntos = 100
		self.inicializar()
	}

	override method efectoPara(unPersonaje) {
		unPersonaje.enfurecerPor(5000)
	}

}

class Heart inherits Fruta {

	method iniciar() {
		nombre = "heart"
		cooldown = 50000
		puntos = 100
		self.inicializar()
	}

	override method efectoPara(unPersonaje) {
		unPersonaje.ganarVida()
	}

}

class Pizza inherits Fruta {

	method iniciar() {
		nombre = "pizza"
		cooldown = 75000
		puntos = 200
		self.inicializar()
	}

	override method efectoPara(unPersonaje) {
		unPersonaje.ganarVida()
		unPersonaje.enfurecerPor(10000)
	}

}

class Chilly inherits Fruta {

	method iniciar() {
		nombre = "chilly"
		cooldown = 100000
		puntos = 500
		position = carcel
		game.addVisual(self)
	}

	override method efectoPara(unJugador) {
		new FireBall(nombre = "fireball").aparecerConPor(unJugador, 400)
	}

}

