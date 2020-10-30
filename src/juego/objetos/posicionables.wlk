import wollok.game.*
import juego.posicionadores.*

class Posicionable {

	var property position = game.origin()
	var nombre = "Alf.png"

}

class Estructura inherits Posicionable {

	method dibujar() {
		position.drawElement(self)
	}

	method puedeSerComidoPor(unPersonaje) = false

}

class Consumible inherits Posicionable {

	var puntos = 0
	var carcel = game.origin()

	method esUtilizable() = false

	method esTraspasable() = true

	method puntos() = puntos

}

