import wollok.game.*

class Wall {
	var position
	method image() = "wall.jpg"
	method esTraspasable() = false
	method position() = position
	method dibujar() { position.drawElement(self) }
}

object generadorDeMuros{
	const muros = []
	method verticalWall(cantidad,inicio){ (0 .. cantidad - 1).forEach { n => muros.add(new Wall(position = game.at(inicio.x(),  n + inicio.y()))) } }
	method horizontalWall(cantidad,inicio){ (0 .. cantidad - 1).forEach { n => muros.add(new Wall(position = game.at( n + inicio.x(), inicio.y()))) } }
	method cube(inicio){
		self.verticalWall(2,inicio)
		self.verticalWall(2,inicio.right(1))
	}
	method upT(largo,alto,inicio){
		self.horizontalWall(largo,inicio)
		self.verticalWall(alto - 1 ,inicio.down(alto - 1).right((largo/2).truncate(0)))
	}
	method downT(largo,alto,inicio){
		self.horizontalWall(largo,inicio)
		self.verticalWall(alto - 1 ,inicio.up(1).right((largo/2).truncate(0)))	
	}
	method crearMapa(){
		/* PAREDES EXTERIORES */
		self.verticalWall(21,game.at(0,0))
		self.verticalWall(21,game.at(20,0))
		self.horizontalWall(20,game.at(1,0))
		self.horizontalWall(20,game.at(1,20))
		/* CUBOS */
		self.cube(game.at(3,6))
		self.cube(game.at(3,13))
		self.cube(game.at(16,6))
		self.cube(game.at(16,13))
		/* PAREDES HORIZONTALES INDIVIDUALES */
		self.horizontalWall(3,game.at(1,9))
		self.horizontalWall(3,game.at(1,11))
		self.horizontalWall(3,game.at(17,9))
		self.horizontalWall(3,game.at(17,11))
		self.horizontalWall(3,game.at(6,2))
		self.horizontalWall(3,game.at(12,2))
		self.horizontalWall(3,game.at(6,18))
		self.horizontalWall(3,game.at(12,18))
		self.horizontalWall(3,game.at(4,4))
		self.horizontalWall(3,game.at(14,4))
		self.horizontalWall(3,game.at(4,16))
		self.horizontalWall(3,game.at(14,16))
		/* PAREDES VERTICALES INDIVIDUALES */
		self.verticalWall(2,game.at(4,1))
		self.verticalWall(2,game.at(4,18))
		self.verticalWall(2,game.at(16,1))
		self.verticalWall(2,game.at(16,18))
		self.verticalWall(2,game.at(8,6))
		self.verticalWall(2,game.at(8,13))
		self.verticalWall(2,game.at(12,6))
		self.verticalWall(2,game.at(12,13))
		self.verticalWall(2,game.at(1,4))
		self.verticalWall(2,game.at(1,15))
		self.verticalWall(2,game.at(19,4))
		self.verticalWall(2,game.at(19,15))
		self.verticalWall(2,game.at(6,5))
		self.verticalWall(2,game.at(6,13))
		self.verticalWall(2,game.at(14,5))
		self.verticalWall(2,game.at(14,13))
		/* PUNTOS INDIVIDUALES */
		muros.add(new Wall(position = game.at(2,2)))
		muros.add(new Wall(position = game.at(18,18)))
		muros.add(new Wall(position = game.at(2,18)))
		muros.add(new Wall(position = game.at(18,2)))
		muros.add(new Wall(position = game.at(2,4)))
		muros.add(new Wall(position = game.at(2,16)))
		muros.add(new Wall(position = game.at(18,4)))
		muros.add(new Wall(position = game.at(18,16)))
		muros.add(new Wall(position = game.at(2,7)))
		muros.add(new Wall(position = game.at(2,13)))
		muros.add(new Wall(position = game.at(18,7)))
		muros.add(new Wall(position = game.at(18,13)))
		/* Ts */
		self.upT(5,3,game.at(8,4))
		self.upT(3,4,game.at(9,9))
		self.upT(3,2,game.at(5,9))
		self.upT(3,2,game.at(13,9))
		self.downT(5,3,game.at(8,16))
		self.downT(3,4,game.at(9,11))
		self.downT(3,2,game.at(5,11))
		self.downT(3,2,game.at(13,11))
	}
	method generar(){ 
		self.crearMapa()
		muros.forEach({unMuro => unMuro.dibujar()})
	}
}