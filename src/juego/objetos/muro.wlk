import wollok.game.*

class Wall {

	var position

	method image() = "wall.png"

	method esUtilizable() = false

	method esTraspasable() = false

	method position() = position

	method dibujar() {
		position.drawElement(self)
	}

	method puedeSerComidoPor(unPersonaje) = false

}
