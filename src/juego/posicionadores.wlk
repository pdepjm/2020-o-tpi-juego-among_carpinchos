import wollok.game.*
import juego.grilla.*


class Posicionador{
	method esPosUsable(unaPos) = unaPos.allElements().all({ unElemento => unElemento.esTraspasable() })
	method randomPosPara(unPersonaje){ unPersonaje.position(grillaDeJuego.unaPos())}
}

object posicionadorFantasma inherits Posicionador{
	method elMasCercanoAlObjetivoDeEn(unEnemigo, unasPos) = unasPos.minIfEmpty({ unaPos => unaPos.distance(unEnemigo.objetivo()) }, { unEnemigo.lastPos() } )
	method filtrarPosUsablesEn(unasPos) { unasPos.removeAllSuchThat({unaPos => !self.esPosUsable(unaPos)}) }
	method nuevaPosPara(unEnemigo){
			const movPos =  [
				unEnemigo.position().up(1),
				unEnemigo.position().down(1),
				unEnemigo.position().left(1),
				unEnemigo.position().right(1)
			]
			if (movPos.contains(unEnemigo.lastPos())) movPos.remove(unEnemigo.lastPos())
			self.filtrarPosUsablesEn(movPos)
			unEnemigo.position(self.elMasCercanoAlObjetivoDeEn(unEnemigo, movPos))
	}
	method calcularObjetivoPara(unEnemigo){}
}

object posicionadorPacman inherits Posicionador{
	method proxPosDe(unPersonaje) {
			var aux
			if(unPersonaje.sentido() == "left"){
				aux = unPersonaje.position().left(1)
			}else if(unPersonaje.sentido() == "right"){
				aux = unPersonaje.position().right(1)
			}else if(unPersonaje.sentido() == "up"){
				aux = unPersonaje.position().up(1)
			}else{
				aux = unPersonaje.position().down(1)
			}
			return aux
		}
	method nuevaPosPara(unPersonaje) {
			if(self.esPosUsable(self.proxPosDe(unPersonaje)))
				unPersonaje.position(self.proxPosDe(unPersonaje))
	}
}
