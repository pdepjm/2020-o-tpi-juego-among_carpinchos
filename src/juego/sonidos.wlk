import wollok.game.*

object sonidos {

	var elGame = game // por defecto es el típico game

	method elGame(unGame) { // el setter
		elGame = unGame
	}

	method reproducir(nombre) {
		elGame.sound("sounds/" + nombre).play()
	}

}

