import wollok.game.*

class GamePad {

	var arriba
	var abajo
	var derecha
	var izquierda

	method iniciar(unPersonaje) {
		arriba.onPressDo({ unPersonaje.sentido("up")})
		abajo.onPressDo({ unPersonaje.sentido("down")})
		izquierda.onPressDo({ unPersonaje.sentido("left")})
		derecha.onPressDo({ unPersonaje.sentido("right")})
	}

}
