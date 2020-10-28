import wollok.game.*

class Portal {
	var property position 
	var property salida = self
	var estado = "closed"
	
	method estado(unEstado){ estado = unEstado }
	method image() = "portales/" + estado + ".png"
	method anexarCon(otroPortal){
		otroPortal.salida(self)
		otroPortal.estado("out")
		self.salida(otroPortal)
		estado = "in"
	}
	method interactuarCon(unPersonaje){ self.teletransportarA(unPersonaje)}
	method esTraspasable() = true
	method dibujar() { position.drawElement(self) }
	method puedeSerComidoPor(unPerosnaje)= false
	method teletransportarA(unPersonaje){ unPersonaje.position(salida.position()) }
}
