import wollok.game.*
import juego.objetos.posicionables.Consumible

class Orbe inherits Consumible {

	method image() = "numbers/" + nombre + "-" + puntos.toString() + ".png"

	method mostrarse() {
		nombre = "numero"
		game.addVisual(self)
		game.schedule(2000, { game.removeVisual(self)})
	}

	method puedeSerComidoPor(unPersonaje) = false

	method interactuarCon(unPersonaje) {
	}

}

