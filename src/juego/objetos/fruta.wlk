import wollok.game.*
import juego.posicionadores.Posicionador

const posicionadorFruta = new Posicionador()

class Fruta{
	const posicionador = posicionadorFruta
	var property position = game.at(23,14)
	
	method image() = "frutas/" + self.nombre() + ".png"
	method nombre()
	method cooldown()
	method puntos()
	method iniciar(){
		game.addVisual(self)
		posicionador.randomPosPara(self)
	}
	method efectoPara(unPersonaje)
	method esTraspasable() = true
	method serComidoPor(unPersonaje){
		unPersonaje.sumarPuntos(self.puntos())
		self.efectoPara(unPersonaje)
		position = game.at(23,14)
		game.schedule(self.cooldown(), { posicionador.randomPosPara(self) })
	}
	method interactuarCon(unPersonaje){ self.serComidoPor(unPersonaje) }	
}

class Banana inherits Fruta{
	override method cooldown() = 25000
	override method puntos() = 50
	override method nombre() = "banana"
	override method efectoPara(unPersonaje){ unPersonaje.enfurecerPor(10000) }
}

class Cherry inherits Fruta{
	override method cooldown() = 15000
	override method puntos() = 100
	override method nombre() = "cherry"
	override method efectoPara(unPersonaje){ unPersonaje.enfurecerPor(5000) }
}

class Heart inherits Fruta{
	override method cooldown() = 50000
	override method puntos() = 100
	override method nombre() = "heart"
	override method efectoPara(unPersonaje){ unPersonaje.ganarVida() }
}

class Pizza inherits Fruta{
	override method cooldown() = 75000
	override method puntos() = 200
	override method nombre() = "pizza"
	override method efectoPara(unPersonaje){
		unPersonaje.ganarVida()
		unPersonaje.enfurecerPor(10000)
	}
}