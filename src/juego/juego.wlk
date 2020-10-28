import wollok.game.*
import juego.grilla.*
import juego.posicionadores.*
import juego.actitudes.*
import juego.objetos.fantasma.*
import juego.objetos.fruta.*
import juego.objetos.pacman.*
import juego.objetos.portal.*
import juego.objetos.estructura.*
 
object menu{
	var enJuego = false
	var imagen = 1
	var property position = game.at(0,0)
	method image() = "menu/" + imagen.toString() + "PlayerMenu.png"
	method puedeSerComidoPor(unPersonaje) = false
	method mostrar(){
		game.addVisual(self)
		keyboard.num1().onPressDo({ if (!enJuego) imagen = 1 })
		keyboard.num2().onPressDo({ if (!enJuego) imagen = 2 })
		keyboard.enter().onPressDo({
			if (!enJuego){
				enJuego = true
				if (imagen.equals(1)){
					mrMsPacMan.posicionables().remove(msPacman)
					msPacman.jugando(false)
					imagen = 4
				}else imagen = 3
				mrMsPacMan.jugar()
			}
		})
	}
}

object mrMsPacMan {
	const personajes = [mrPacman,msPacman]
	const enemigos = []
	const posicionables = []
	
	method posicionables() = posicionables
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
	method agregarEnemigos(unaCantidad){
		(1 .. unaCantidad).forEach({ n => enemigos.add(new Fantasma())})
	}
	method agregarPersonajes() {
		self.agregarEnemigos(1)
		self.setearMovimientosPara(personajes, 500)
		self.setearMovimientosPara(enemigos, 501)
		posicionables.addAll([
			new Banana(),
			new Banana(),
			new Banana(),
			new Cherry(),
			new Cherry(),
			new Heart(),
			new Pizza(),
			new Chilly()
		])
		posicionables.addAll( enemigos )
		posicionables.addAll( personajes )
		posicionables.forEach({unPosicionable => unPosicionable.iniciar() })
	}
	method iniciar() {
		generadorDeMuros.generar()
		grillaDeJuego.generarGrillaDe(21,21)
		self.iniciarActitudes()
		self.agregarPersonajes()
		menu.mostrar()
		game.start()
	}
	method jugar(){
		posicionables.forEach({unPosicionable => unPosicionable.aparecer()})
	}
}