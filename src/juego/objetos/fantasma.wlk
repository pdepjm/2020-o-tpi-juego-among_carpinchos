import wollok.game.*
import juego.objetos.posicionables.Consumible
import juego.actitudes.listaActitudes
import juego.posicionadores.posicionadorFantasma
import juego.objetos.orbesPuntos.Orbe

const nombres = [ "lime", "red", "cyan", "pink", "yellow" ]

class Fantasma inherits Consumible {

	var actitud = listaActitudes.anyOne()
	var lastPos = position
	const posicionador = posicionadorFantasma

	override method position(unaPos) {
		lastPos = position
		position = unaPos
	}

	method image() = "enemigo/" + nombre + "/" + actitud.nombre() + ".png"

	method encarcelar() {
		position = carcel
	}

	method jugando() = true

	method tieneVidas() = true

	method lastPos() = lastPos

	method iniciar() {
		carcel = game.at(23, 8)
		position = carcel
		lastPos = position
		nombre = nombres.anyOne()
		self.setearPuntaje()
		game.addVisual(self)
		game.onCollideDo(self, { colisionado =>
			if (colisionado.esUtilizable()) colisionado.interactuarCon(self)
		})
	}

	method setearPuntaje() {
		puntos = 50 * (1 .. 4).anyOne()
	}

	method aparecer() {
		self.setearPuntaje()
		posicionador.randomPosPara(self)
	}

	method objetivo() = actitud.objetivoDe(self)

	method puedeSerComidoPor(unPersonaje) = unPersonaje.estado().equals("furioso")

	method serComidoPor(unPersonaje) {
		if (!unPersonaje.testMode()) game.sound("sounds/comer.mp3").play()
		unPersonaje.sumarPuntos(puntos)
		new Orbe(puntos = puntos, position = position).mostrarse()
		position = carcel
		nombre = nombres.anyOne()
		actitud = listaActitudes.anyOne()
		game.schedule(5000, { self.aparecer()})
	}

	method interactuarCon(unPersonaje) {
		if (self.puedeSerComidoPor(unPersonaje)) self.serComidoPor(unPersonaje) else unPersonaje.serEliminado()
	}

	method mover() {
		posicionador.nuevaPosPara(self)
	}

}

