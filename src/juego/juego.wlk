import wollok.game.*
import juego.grilla.*
import juego.posicionadores.*
import juego.actitudes.*
import juego.objetos.fantasma.*
import juego.objetos.fruta.*
import juego.objetos.pacman.*
import juego.objetos.estructura.*
 
object menu{
	var enJuego = false
	var imagen = 1
	var property position = game.at(0,0)
	method image() = "menu/" + imagen.toString() + "PlayerMenu.png"
	method puedeSerComidoPor(unPersonaje) = false
	method mostrar(){
		game.addVisual(self)
		keyboard.del().onPressDo({ 
			if (!enJuego) game.stop()
			else mrMsPacMan.reiniciar()
		})
		keyboard.num1().onPressDo({ 
			if (!enJuego) {
				imagen = 1
				msPacman.jugando(false)
			}
		})
		keyboard.num2().onPressDo({ 
			if (!enJuego) {
				imagen = 2
				msPacman.jugando(true)
			}
		})
		keyboard.enter().onPressDo({
			if (!enJuego){
				enJuego = true
				if (imagen.equals(1)){
					imagen = 4
				}else imagen = 3
				mrMsPacMan.jugar()
			}
		})
	}
	method reiniciar(){
		enJuego = false
		imagen = 1
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
			if (unaListaDePersonajes.all({ unPersonaje => !unPersonaje.jugando() || !unPersonaje.tieneVidas() }))
				self.reiniciar()
			else unaListaDePersonajes.forEach({unPersonaje => unPersonaje.mover()})
		})
	}
	method agregarEnemigos(unaCantidad){ (1 .. unaCantidad).forEach({ n => enemigos.add(new Fantasma())})}
	method agregarMonedas(unaCantidad){ (1 .. unaCantidad).forEach({ n => posicionables.add(new Coin())})}
	method agregarBananas(unaCantidad){ (1 .. unaCantidad).forEach({ n => posicionables.add(new Banana())})}
	method agregarCherrys(unaCantidad){ (1 .. unaCantidad).forEach({ n => posicionables.add(new Cherry())})}
	method agregarPizzas(unaCantidad){ (1 .. unaCantidad).forEach({ n => posicionables.add(new Pizza())})}
	method agregarCorazones(unaCantidad){ (1 .. unaCantidad).forEach({ n => posicionables.add(new Heart())})}
	method agregarChillys(unaCantidad){ (1 .. unaCantidad).forEach({ n => posicionables.add(new Chilly())})}
	method agregarFrutas(){
		self.agregarMonedas(30)
		self.agregarCherrys(3)
		self.agregarBananas(2)
		self.agregarCorazones(1)
		self.agregarPizzas(1)
		self.agregarChillys(1)
	}
	method inicializarPosicionables() {
		self.agregarEnemigos(1)
		self.setearMovimientosPara(personajes, 500)
		self.setearMovimientosPara(enemigos, 501)
		self.agregarFrutas()
		posicionables.addAll( enemigos )
		posicionables.addAll( personajes )
		posicionables.forEach({unPosicionable => unPosicionable.iniciar() })
	}
	method iniciar() {
		generadorDeMuros.generar()
		grillaDeJuego.generarGrillaDe(21,21)
		self.iniciarActitudes()
		self.inicializarPosicionables()
		menu.mostrar()
		game.start()
	}
	method jugar(){ posicionables.forEach({unPosicionable => unPosicionable.aparecer()}) }
	method reiniciar(){
		posicionables.forEach({unPosicionable => unPosicionable.encarcelar()})
		menu.reiniciar()
	}
}