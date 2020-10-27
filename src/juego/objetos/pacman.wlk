import wollok.game.*
import juego.posicionadores.posicionadorPacman

class Pacman{
	const posicionador = posicionadorPacman
	var property position = game.at(21,21)
	var property sentido = "up"
	var estado = "normal"
	var estaCerrado = false
	var mortal = false
	var gamepad
	var vidas = 3
	var puntos = 0
	
	method image() = if (estaCerrado) self.imagenCerrado() else self.imagenEstado()
	method imagenEstado() = "pacman/" + self.nombre() + "/" + estado + "-" + self.sentido() + ".png"
	method imagenCerrado() = "pacman/" + estado +"-closed.png"
	method esTraspasable() = true
	method puntos() = puntos
	method nombre()
	method configGamepad()
	method iniciar(){
		self.configGamepad()
		gamepad.iniciar(self)
		game.addVisual(self)
		self.aparecer()
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
		game.say(self, puntos.toString() + " PUNTOS")
	}
	method ganarVida() { 
		vidas += 1
		game.say(self, vidas.toString() + " VIDAS")
	}
	method vidas() = vidas
	method puedeMatar() = estado.equals("furioso")
	method posicionador() = position
	method serComidoPor(unPersonaje) {
		unPersonaje.sumarPuntos(50)
		self.serEliminado()
	}
	method serEliminado(){
		if (mortal){
			vidas -= 1
			game.say(self, vidas.toString() + " VIDAS RESTANTES")
			if(vidas==0) game.removeVisual(self)
			else self.aparecer()
		}
		else game.say(self, "LA INMUNIDAD TEMPORAL ESTABA ACTIVADA")
	}
	method aparecer(){
		mortal = false
		posicionador.randomPosPara(self)
		game.schedule(5000, { mortal = true })
	}
	method mover(){ 
		self.animar()
		posicionador.nuevaPosPara(self)
	}
}

object mrPacman inherits Pacman{
	
	override method nombre() = "mrPacman"
	override method configGamepad(){
		gamepad = new Gamepad(arriba = keyboard.w(), abajo = keyboard.s(), derecha = keyboard.d(), izquierda = keyboard.a())
	}
}

object msPacman inherits Pacman{
	
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