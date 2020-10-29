import wollok.game.*
import juego.posicionadores.Posicionador

const posicionadorFruta = new Posicionador()

class Fruta{
	const carcel = game.at(23,13)
	const posicionador = posicionadorFruta
	var property position = carcel
	
	method image() = "frutas/" + self.nombre() + ".png"
	method nombre()
	method cooldown()
	method puntos()
	method jugando() = true
	method tieneVidas() = true
	method iniciar(){
		game.addVisual(self)
	}
	method puedeSerComidoPor(unPersonaje) = true
	method efectoPara(unPersonaje)
	method encarcelar() { position = carcel }
	method esUtilizable() = false
	method esTraspasable() = true
	method serComidoPor(unPersonaje){
		game.sound("sounds/comer.mp3").play()
		unPersonaje.sumarPuntos(self.puntos())
		position = carcel
		self.efectoPara(unPersonaje)
		game.schedule(self.cooldown(), { self.aparecer() })
	}
	method interactuarCon(unPersonaje){ self.serComidoPor(unPersonaje) }
	method aparecer(){ posicionador.randomPosPara(self) }
}

class Coin inherits Fruta{
	override method cooldown() = 5000
	override method puntos() = 25
	override method nombre() = "coin"
	override method efectoPara(unPersonaje){}
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

class Chilly inherits Fruta{
	var unaFireball = null
	override method cooldown() = 100000
	override method puntos() = 500
	override method nombre() = "chilly"
	override method efectoPara(unJugador){ unaFireball.aparecerConPor(unJugador, 400) }
	override method iniciar(){
		super()
		unaFireball = new FireBall()
		unaFireball.iniciar()
	}
	override method encarcelar(){
		super()
		unaFireball.encarcelar()
	}
}

class FireBall {
	const carcel = game.at(21,0)
	var property position = carcel 
	
	method image() = "fireball.png"
	method iniciar(){ game.addVisual(self) }
	method comestiblesEnAreaDe(unPersonaje){
		const comestibles = []
		(0 .. 4).forEach { x => 
			(0 .. 4).forEach { y => 
				const objetos = game.getObjectsIn(position.right(x).up(y))
				objetos.removeAllSuchThat({ elemento => !elemento.puedeSerComidoPor(unPersonaje)})
				comestibles.addAll(objetos)
			}
		}
		return comestibles
	}
	method aparecer(){}
	method puedeSerComidoPor(unPersonaje) = false
	method encarcelar() { position = carcel }
	method esUtilizable() = false
	method esTraspasable() = true
	method aparecerConPor(unPersonaje, unTiempo){
		position = unPersonaje.position().down(2).left(2)
		unPersonaje.enfurecerPor(unTiempo)
		self.comestiblesEnAreaDe(unPersonaje).forEach({ unComestible => unComestible.serComidoPor(unPersonaje)})
		game.schedule(unTiempo, { position = carcel })
	}
		
}
