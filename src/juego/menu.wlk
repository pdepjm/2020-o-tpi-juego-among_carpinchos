import wollok.game.*
import juego.objetos.pacman.*
import juego.mrMsPacMan.mrMsPacMan

object menu {

	var enJuego = false
	var imagen = 1
	var property position = game.at(0, 0)

	method image() = "menu/" + imagen.toString() + "PlayerMenu.png"

	method puedeSerComidoPor(unPersonaje) = false

	method mostrar() {
		game.addVisual(self)
		keyboard.del().onPressDo({ if (!enJuego) game.stop() else mrMsPacMan.reiniciar()
		})
		keyboard.num1().onPressDo({ if (!enJuego) {
				imagen = 1
				msPacman.jugando(false)
			}
		})
		keyboard.num2().onPressDo({ if (!enJuego) {
				imagen = 2
				msPacman.jugando(true)
			}
		})
		keyboard.enter().onPressDo({ if (!enJuego) {
				enJuego = true
				if (imagen.equals(1)) {
					imagen = 4
				} else imagen = 3
				mrMsPacMan.jugar()
			}
		})
	}

	method reiniciar() {
		enJuego = false
		imagen = 1
	}

}

