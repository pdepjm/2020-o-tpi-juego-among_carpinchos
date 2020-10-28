import wollok.game.*
import juego.grilla.*

class Actitud {
	const personajesDisponibles = []
	method setearDisponibles(unosPersonajes) { personajesDisponibles.addAll(unosPersonajes)}
}

object timida inherits Actitud{ //BUSCA SIEMPRE AL JUGADOR MAS LEJANO, INDIRECTAMENTE DEJANDOLO "EN EL MEDIO" (TIMIDEZ)
	method image() = "shy.png"
	method objetivoDe(unEnemigo) = personajesDisponibles.max({ unPersonaje => unEnemigo.position().distance(unPersonaje.position()) }).position()
}

object cazadora inherits Actitud{ //BUSCA SIEMPRE AL JUGADOR QUE TENGA MAS CERCA 
	method image() = "hunter.png"
	method objetivoDe(unEnemigo) = personajesDisponibles.min({ unPersonaje => unEnemigo.position().distance(unPersonaje.position()) }).position()
}

object tontita inherits Actitud{ //BUSCA A CUALQUIER PERSONAJE, PORQUE NO LE DA LA CABEZA
	method image() = "dumb.png"
	method objetivoDe(unEnemigo) = personajesDisponibles.anyOne().position()
}

object stalker inherits Actitud { //LO PEOR DE LOS PEOR, SE LA AGARRA CON UNO Y SIEMPRE LO VA A BUSCAR
	var stalkeado
	method image() = "stalker.png"
	method victima() { stalkeado = personajesDisponibles.anyOne() }
	method objetivoDe(unEnemigo) { 
		if (stalkeado.vidas().equals(0)) 
			self.victima()
		return stalkeado.position()
			}
	override method setearDisponibles(unosPersonajes) { 
		personajesDisponibles.addAll(unosPersonajes)
		self.victima()
	}
}

object exploradora{ //VA RECORRIENDO EL MAPA, DIRIGIENDOSE SIEMPRE A DISTINTAS POSICIONES, SIN INTENCIÓN DE MOLESTAR A NADIE
	method image() = "explorador.png"
	method objetivoDe(unEnemigo) = grillaDeJuego.grilla().anyOne()
}