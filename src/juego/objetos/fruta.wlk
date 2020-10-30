import wollok.game.*
import juego.posicionadores.posicionadorFruta
import juego.objetos.posicionables.Consumible

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
		game.sound("sounds/comer.mp3").play()
		unPersonaje.sumarPuntos(puntos)
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

	var unaFireball = null

	method iniciar() {
		nombre = "chilly"
		cooldown = 100000
		puntos = 500
		position = carcel
		unaFireball = new FireBall()
		unaFireball.iniciar()
		game.addVisual(self)
	}

	override method efectoPara(unJugador) {
		unaFireball.aparecerConPor(unJugador, 400)
	}

	override method encarcelar() {
		super()
		unaFireball.encarcelar()
	}

}

class FireBall inherits Consumible {

	method image() = "fireball.png"

	method iniciar() {
		carcel = game.at(21, 0)
		position = carcel
		game.addVisual(self)
	}

	method comestiblesEnAreaDe(unPersonaje) {
		const comestibles = []
		(0 .. 4).forEach{ x => (0 .. 4).forEach{ y =>
			const objetos = game.getObjectsIn(position.right(x).up(y))
			objetos.removeAllSuchThat({ elemento => !elemento.puedeSerComidoPor(unPersonaje)})
			comestibles.addAll(objetos)
		}}
		return comestibles
	}

	method aparecer() {
	}

	method puedeSerComidoPor(unPersonaje) = false

	method encarcelar() {
		position = carcel
	}

	method aparecerConPor(unPersonaje, unTiempo) {
		position = unPersonaje.position().down(2).left(2)
		unPersonaje.enfurecerPor(unTiempo)
		self.comestiblesEnAreaDe(unPersonaje).forEach({ unComestible => unComestible.serComidoPor(unPersonaje)})
		game.schedule(unTiempo, { position = carcel})
	}

}

