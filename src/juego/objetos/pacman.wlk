import wollok.game.*
import juego.posicionadores.posicionadorPacman
import juego.objetos.barraLateral.*

class Pacman{
	const posicionador = posicionadorPacman
	const carcel = game.at(23,4)
	var property position = carcel
	var property sentido = "up"
	var estado = "normal"
	var estaCerrado = false
	var mortal = false
	var gamepad
	var vidas = 3
	var puntos = 0
	var property jugando = true
	var mostradorDePuntos = null
	
	method image() = if (estaCerrado) self.imagenCerrado() else self.imagenEstado()
	method imagenEstado() = "pacman/" + self.nombre() + "/" + estado + "-" + self.sentido() + ".png"
	method imagenCerrado() = "pacman/" + estado +"-closed.png"
	method encarcelar() { 
		position = carcel
		vidas = 3
	}
	method esUtilizable() = false
	method esTraspasable() = true
	method tieneVidas() = vidas > 0
	method puntos() = puntos
	method nombre()
	method configGamepad()
	method iniciar(){
		self.configGamepad()
		gamepad.iniciar(self)
		game.addVisual(self)
		game.onCollideDo(self, { colisionado => colisionado.interactuarCon(self) })
	}
	method interactuarCon(unPersonaje){ game.say(self, "Hola bro") }
	method animar() { estaCerrado = !estaCerrado }
	method estado() = estado
	method enfurecerPor(unTiempo){ 
		estado = "furioso"
		game.schedule(unTiempo, { estado = "normal" })
	}
	method sumarPuntos(unosPuntos){
		puntos += unosPuntos
		self.emitirMensaje( puntos.toString() + " PUNTOS" )
	}
	method ganarVida() { 
		vidas = (vidas + 1).min(5)
		if (vidas.equals(5)) self.emitirMensaje("VIDA MÁXIMA ALCANZADA")
	}
	method vidas() = vidas
	method puedeMatar() = estado.equals("furioso")
	method posicionador() = position
	method puedeSerComidoPor(unPersonaje) = false
	method serEliminado(){
		if (mortal){
			game.sound("sounds/gameOver.wav").play()
			vidas = (vidas - 1).max(0)
			if(vidas.equals(0)) {
				position = carcel
			}
			else self.aparecer()
		}
		else self.emitirMensaje("LA INMUNIDAD TEMPORAL ESTABA ACTIVADA")
	}
	method aparecer(){
		if(jugando){
			mortal = false
			posicionador.randomPosPara(self)
			game.schedule(5000, { mortal = true })
		}
	}
	method mover(){ 
		self.animar()
		posicionador.nuevaPosPara(self)
	}
	
	method emitirMensaje (mensaje) { mostradorDePuntos.emitir(mensaje) }

	method toggleMortal () {mortal = !mortal}
}

object mrPacman inherits Pacman{
	// esta en override para agregar el mostrador de puntos y vidas en una posicon especial
	override method iniciar(){
		super()
		mostradorDePuntos = new Puntos(position = game.at(22, 18), nombre=self.nombre())
		const mostradorDeVidas = new Corazones(position = game.at(23, 18), jugador=self)
		game.addVisual(mostradorDePuntos)
		game.addVisual(mostradorDeVidas)
	}
	
	override method nombre() = "mrPacman"
	override method configGamepad(){
		gamepad = new Gamepad(arriba = keyboard.w(), abajo = keyboard.s(), derecha = keyboard.d(), izquierda = keyboard.a())
	}
}

object msPacman inherits Pacman{
	
	override method iniciar(){
		super()
		mostradorDePuntos = new Puntos(position = game.at(22, 16), nombre=self.nombre())
		const mostradorDeVidas = new Corazones(position = game.at(23, 16), jugador=self)
		game.addVisual(mostradorDePuntos)
		game.addVisual(mostradorDeVidas)
	}
	
	override method nombre() = "msPacman"
	override method configGamepad(){
		gamepad = new Gamepad(arriba = keyboard.up(), abajo = keyboard.down(), derecha = keyboard.right(), izquierda = keyboard.left())
	}
}

class Gamepad{
	
	var arriba
	var abajo
	var derecha
	var izquierda
	
	method iniciar(unPersonaje){
		arriba.onPressDo({ unPersonaje.sentido("up") })
		abajo.onPressDo({ unPersonaje.sentido("down") })
		izquierda.onPressDo({ unPersonaje.sentido("left") })
		derecha.onPressDo({ unPersonaje.sentido("right") })
	}
}