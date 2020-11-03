import wollok.game.*
import juego.sonidos.*
import juego.objetos.posicionables.Consumible

class FireBall inherits Consumible {

	method image() = nombre + ".png"

	method comestiblesEnAreaDe(unPersonaje) {
		const comestibles = []
		(0 .. 4).forEach{ x => (0 .. 4).forEach{ y =>
			const objetos = game.getObjectsIn(position.right(x).up(y))
			objetos.removeAllSuchThat({ elemento => !elemento.puedeSerComidoPor(unPersonaje)})
			comestibles.addAll(objetos)
		}}
		return comestibles
	}

	method puedeSerComidoPor(unPersonaje) = false

	method interactuarCon(unPersonaje) {
	}

	method aparecerConPor(unPersonaje, unTiempo) {
		game.addVisual(self)
		position = unPersonaje.position().down(2).left(2)
		unPersonaje.enfurecerPor(unTiempo)
		self.comestiblesEnAreaDe(unPersonaje).forEach({ unComestible => unComestible.serComidoPor(unPersonaje)})
		sonidos.reproducir("explosion.mp3")
		game.schedule(unTiempo, { game.removeVisual(self)})
	}

}

