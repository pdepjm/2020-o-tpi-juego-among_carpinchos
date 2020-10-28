import wollok.game.*
import juego.grilla.*
import juego.posicionadores.*
import juego.actitudes.*
import juego.objetos.fantasma.*
import juego.objetos.fruta.*
import juego.objetos.pacman.*
import juego.objetos.portal.*
import juego.objetos.estructura.*
 
object mrMsPacMan {
	const personajes = []
	const movibles = []
	const posicionables = []
	
	method iniciarActitudes(){
		timida.setearDisponibles(personajes)
		cazadora.setearDisponibles(personajes)
		tontita.setearDisponibles(personajes)
		stalker.setearDisponibles(personajes)
	}
	method setearMovimientosPara(unaListaDePersonajes, unaFrecuencia){
		game.onTick(unaFrecuencia, "Movimientos", { 
			unaListaDePersonajes.forEach({unPersonaje => unPersonaje.mover()})
		})
	}
	method personajesJugables(unosPersonajes) { 
		personajes.addAll(unosPersonajes)
		movibles.addAll(unosPersonajes)
	}
	method agregarPersonajes() {
		const portalA = new Portal(position = game.at(1,10))
		const portalB = new Portal(position = game.at(19,10))
		portalA.anexarCon(portalB)
		posicionables.addAll([
			portalA,
			portalB,
			new Banana(),
			new Banana(),
			new Banana(),
			new Cherry(),
			new Cherry(),
			new Heart(),
			new Pizza()
		])
		movibles.addAll([
			/*new Fantasma(), 
			new Fantasma(), 
			new Fantasma(), 
			new Fantasma(),*/
			new Fantasma()
		])
		posicionables.addAll( movibles )
		posicionables.forEach({unPosicionable => unPosicionable.iniciar() })
	}
	method iniciar() {
		generadorDeMuros.generar()
		grillaDeJuego.generarGrillaDe(21,21)
		self.personajesJugables([mrPacman])
		self.iniciarActitudes()
		self.agregarPersonajes()
		self.setearMovimientosPara(movibles, 500)
		game.start()
	}
}