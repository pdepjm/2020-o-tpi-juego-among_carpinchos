import wollok.game.*

object grillaDeJuego{
	const grilla = []
	method grilla() = grilla
	method esUnaPosLibre(unaPos) = unaPos.allElements().isEmpty()
	method filtrarPosLibresEn(unaGrilla) { unaGrilla.removeAllSuchThat({unaPos => !self.esUnaPosLibre(unaPos)}) }
	method generarGrillaDe(ancho,alto){
		(1 .. ancho - 1).forEach { x => 
			(1 .. alto - 1).forEach { y => grilla.add(game.at(x,y)) }
		}
		self.filtrarPosLibresEn(grilla)
	}
	method unaPos() = if (grilla.isEmpty()) game.at(5,5) else grilla.anyOne()
}