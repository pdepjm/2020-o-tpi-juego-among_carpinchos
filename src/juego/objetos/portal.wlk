import wollok.game.*
import juego.sonidos.*
import juego.objetos.posicionables.Estructura

class Portal inherits Estructura {

	var property salida = self

	method esTraspasable() = true

	method esUtilizable() = true

	method nombre(unNombre) {
		nombre = unNombre
	}

	method image() = "portales/" + nombre + ".png"

	method anexarCon(otroPortal) {
		otroPortal.salida(self)
		otroPortal.nombre("out")
		self.salida(otroPortal)
		nombre = "in"
	}

	method interactuarCon(unPersonaje) {
		sonidos.reproducir("teleport.wav")
		self.teletransportarA(unPersonaje)
	}

	method teletransportarA(unPersonaje) {
		unPersonaje.position(salida.position())
	}

}

