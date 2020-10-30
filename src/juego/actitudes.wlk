import wollok.game.*
import juego.grilla.*
import juego.objetos.pacman.personajes

object timida { //BUSCA SIEMPRE AL JUGADOR MAS LEJANO, INDIRECTAMENTE DEJANDOLO "EN EL MEDIO" (TIMIDEZ)

	method image() = "shy.png"

	method objetivoDe(unEnemigo) = personajes.max({ unPersonaje => unEnemigo.position().distance(unPersonaje.position()) }).position()

}

object cazadora { //BUSCA SIEMPRE AL JUGADOR QUE TENGA MAS CERCA 

	method image() = "hunter.png"

	method objetivoDe(unEnemigo) = personajes.min({ unPersonaje => unEnemigo.position().distance(unPersonaje.position()) }).position()

}

object tontita { //BUSCA A CUALQUIER PERSONAJE, PORQUE NO LE DA LA CABEZA

	method image() = "dumb.png"

	method objetivoDe(unEnemigo) = personajes.anyOne().position()

}

object stalker { //LO PEOR DE LOS PEOR, SE LA AGARRA CON UNO Y SIEMPRE LO VA A BUSCAR

	var stalkeado = self.unaVictima()

	method image() = "stalker.png"

	method unaVictima() = personajes.anyOne()

	method objetivoDe(unEnemigo) {
		if (!stalkeado.jugando() || !stalkeado.tieneVidas()) stalkeado = self.unaVictima()
		return stalkeado.position()
	}

}

object exploradora { //VA RECORRIENDO EL MAPA, DIRIGIENDOSE SIEMPRE A DISTINTAS POSICIONES, SIN INTENCIÓN DE MOLESTAR A NADIE

	method image() = "explorador.png"

	method objetivoDe(unEnemigo) = grillaDeJuego.grilla().anyOne()

}

const listaActitudes = [ timida, cazadora, tontita, stalker, exploradora ]

