import wollok.game.*

class Stats {
	var nombre
	var property position
	method image() = null
	
	method emitir(mensaje){
		game.say(self, mensaje)
	}
}

class Puntos inherits Stats {
	override method image() = "pacman/" + nombre + "/normal-right.png"
}

class Corazones inherits Stats {
	override method image() = "frutas/heart.png"
}