import wollok.game.*



class Puntos {
	var nombre
	var property position
	method image() = "pacman/" + nombre + "/normal-right.png"
	method emitir(mensaje){ game.say(self, mensaje) }
}

class Corazones{
	var property position
	var jugador
	method image() = "healthbar/" + jugador.vidas().toString() + "-heart.png"
}