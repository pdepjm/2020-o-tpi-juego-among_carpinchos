import wollok.game.*
import juego.objetos.posicionables.Posicionable

class MostradorPuntos inherits Posicionable {

	method image() = "pacman/" + nombre + "/normal-right.png"

	method emitir(mensaje) {
		game.say(self, mensaje)
	}

	method iniciarParaEn(unJugador, unaPosicion) {
		position = unaPosicion
		nombre = unJugador.nombre()
		const mostradorVida = new MostradorCorazones()
		mostradorVida.iniciarParaEn(unJugador, unaPosicion.right(1))
		game.addVisual(self)
	}

}

class MostradorCorazones inherits Posicionable {

	method image() = "healthbar/" + nombre.vidas().toString() + "-heart.png"

	method iniciarParaEn(unJugador, unaPosicion) {
		position = unaPosicion
		nombre = unJugador
		game.addVisual(self)
	}

}

