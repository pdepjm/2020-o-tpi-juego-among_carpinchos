import wollok.game.*
import juego.objetos.posicionables.Estructura

class Wall inherits Estructura {

	method image() = nombre

	method esUtilizable() = false

	method esTraspasable() = false

	override method dibujar() {
		super()
		nombre = "wall.png"
	}

}

