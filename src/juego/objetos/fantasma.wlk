import wollok.game.*
import juego.actitudes.*
import juego.posicionadores.posicionadorFantasma

const actitudes = [timida, cazadora, tontita, stalker, exploradora]
const nombres = ["lime", "red", "cyan", "pink", "yellow"]

class Fantasma{
	const carcel = game.at(23,8)
	var nombre = nombres.anyOne()
	var puntos = 0
	var actitud = actitudes.anyOne()
	var position = carcel
	var lastPos = position
	const posicionador = posicionadorFantasma
	
	method image() = "enemigo/" + nombre + "/" + actitud.image()
	method esTraspasable() = true
	method puntos() = puntos
	method position() = position
	method position(unaPos) {
		lastPos = position
		position = unaPos
	}
	method lastPos() = lastPos
	method iniciar(){ 
		game.addVisual(self)
	}
	method setearPuntaje(){ puntos = 50 * (1 .. 4).anyOne() }
	method aparecer(){
		self.setearPuntaje()
		posicionador.randomPosPara(self)
	}
	method objetivo() = actitud.objetivoDe(self)
	method puedeSerComidoPor(unPersonaje) = unPersonaje.estado().equals("furioso")
	method serComidoPor(unPersonaje) {
		unPersonaje.sumarPuntos(puntos)
		position = carcel
		nombre = nombres.anyOne()
		actitud = actitudes.anyOne()
		game.schedule(5000, { self.aparecer() })
	}
	method interactuarCon(unPersonaje){
		if (self.puedeSerComidoPor(unPersonaje)) self.serComidoPor(unPersonaje) else unPersonaje.serEliminado()
	}
	method mover(){ posicionador.nuevaPosPara(self) }
}