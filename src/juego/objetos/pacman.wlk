import wollok.game.*
import juego.sonidos.*
import juego.gamePad.GamePad
import juego.objetos.posicionables.Consumible
import juego.posicionadores.posicionadorPacman
import juego.barraLateral.*

class Pacman inherits Consumible {

	const posicionador = posicionadorPacman
	var property sentido = "up"
	var property jugando = true
	var estado = "normal"
	var estaCerrado = false
	var mortal = false
	var gamepad
	var vidas = 3
	var mostradorDePuntos = null

	method image() = if (estaCerrado) self.imagenCerrado() else self.imagenEstado()

	method imagenEstado() = "pacman/" + nombre + "/" + estado + "-" + self.sentido() + ".png"

	method imagenCerrado() = "pacman/" + estado + "-closed.png"

	method nombre() = nombre

	method encarcelar() {
		position = carcel
		vidas = 3
		puntos = 0
	}

	method tieneVidas() = vidas > 0

	method configGamepad(tUp, tDown, tLeft, tRight) {
		gamepad = new GamePad(arriba = tUp, abajo = tDown, derecha = tRight, izquierda = tLeft)
	}

	method inicializar() {
		carcel = game.at(23, 4)
		position = carcel
		gamepad.iniciar(self)
		game.addVisual(self)
		game.onCollideDo(self, { colisionado => colisionado.interactuarCon(self)})
	}

	method setearTanterosEn(unaPosicion) {
		mostradorDePuntos = new MostradorPuntos()
		mostradorDePuntos.iniciarParaEn(self, unaPosicion)
	}

	method interactuarCon(unPersonaje) {
		game.say(self, "Hola bro")
	}

	method animar() {
		estaCerrado = !estaCerrado
	}

	method estado() = estado

	method enfurecerPor(unTiempo) {
		estado = "furioso"
		game.schedule(unTiempo, { estado = "normal"})
	}

	method sumarPuntos(unosPuntos) {
		puntos += unosPuntos
		self.emitirMensaje(puntos.toString() + " PUNTOS")
	}

	method ganarVida() {
		vidas = (vidas + 1).min(5)
		if (vidas.equals(5)) self.emitirMensaje("VIDA MÁXIMA ALCANZADA")
	}

	method vidas() = vidas

	method puedeMatar() = estado.equals("furioso")

	method posicionador() = position

	method puedeSerComidoPor(unPersonaje) = false

	method serEliminado() {
		if (mortal) {
			sonidos.reproducir("gameOver.wav")
			vidas = (vidas - 1).max(0)
			if (vidas.equals(0)) {
				position = carcel
			} else self.aparecer()
		} else self.emitirMensaje("LA INMUNIDAD TEMPORAL ESTABA ACTIVADA")
	}

	method aparecer() {
		if (jugando) {
			mortal = false
			posicionador.randomPosPara(self)
			game.schedule(5000, { mortal = true})
		}
	}

	method mover() {
		self.animar()
		posicionador.nuevaPosPara(self)
	}

	method emitirMensaje(mensaje) {
		mostradorDePuntos.emitir(mensaje)
	}

	method toggleMortal() {
		mortal = !mortal
	}

}

object mrPacman inherits Pacman {

	method iniciar() {
		nombre = "mrPacman"
		self.configGamepad(keyboard.w(), keyboard.s(), keyboard.a(), keyboard.d())
		self.inicializar()
		self.setearTanterosEn(game.at(22, 18))
	}

}

object msPacman inherits Pacman {

	method iniciar() {
		nombre = "msPacman"
		self.configGamepad(keyboard.up(), keyboard.down(), keyboard.left(), keyboard.right())
		self.inicializar()
		self.setearTanterosEn(game.at(22, 16))
	}

}

const personajes = [ mrPacman, msPacman ]

