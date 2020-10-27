import wollok.game.*
import juego.posicionadores.posicionadorPacman
import juego.objetos.barraLateral.*

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
	var iniciado = false
	var mostradorDePuntos = null
	var mostradorDeVidas = null
	
	method image() = if (estaCerrado) self.imagenCerrado() else self.imagenEstado()
	method imagenEstado() = "pacman/" + self.nombre() + "/" + estado + "-" + self.sentido() + ".png"
	method imagenCerrado() = "pacman/" + estado +"-closed.png"
	method esTraspasable() = true
	method puntos() = puntos
	method nombre()
	method configGamepad()
	method iniciar(){
		iniciado = true
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
		self.emitirPuntos( puntos.toString() + " PUNTOS" )
	}
	method ganarVida() { 
		vidas += 1
		self.emitirVidas(vidas.toString() + " VIDAS")
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
			self.emitirVidas(vidas.toString() + " VIDAS RESTANTES")
			if(vidas==0) game.removeVisual(self)
			else self.aparecer()
			if(
				mrPacman.vidas() == 0 &&
				(!msPacman.iniciado() || msPacman.vidas() == 0)
			) game.stop()
		}
		else self.emitirVidas("LA INMUNIDAD TEMPORAL ESTABA ACTIVADA")
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
	method iniciado () = iniciado
	
	method emitirPuntos (mensaje) {
		if(mostradorDePuntos != null) mostradorDePuntos.emitir(mensaje)
	}
	
	method emitirVidas (mensaje) {
		if(mostradorDeVidas != null) mostradorDeVidas.emitir(mensaje)
	}

	method toggleMortal () {mortal = !mortal}
}

object mrPacman inherits Pacman{
	// esta en override para agregar el mostrador de puntos y vidas en una posicon especial
	override method iniciar(){
		super()
		mostradorDePuntos = new Puntos(position = game.at(22, 19), nombre=self.nombre())
		mostradorDeVidas = new Corazones(position = game.at(24, 19), nombre=self.nombre())
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
		mostradorDePuntos = new Puntos(position = game.at(22, 17), nombre=self.nombre())
		mostradorDeVidas = new Corazones(position = game.at(24, 17), nombre=self.nombre())
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