import wollok.game.*
import juego.objetos.posicionables.Consumible

class Orbe inherits Consumible {

	method image() = "numbers/numero-" + puntos.toString() + ".png"

	method mostrarse() {
		game.addVisual(self)
		game.schedule(2000, { game.removeVisual(self)})
	}

	method puedeSerComidoPor(unPersonaje) = false

	method interactuarCon(unPersonaje) {
	}

}

