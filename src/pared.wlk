import wollok.game.*

class Pared {
	var property position
	method esAtravesable() = false
	method image () = "muro.png"
}
class Mesa {
	var property position
	method esAtravesable() = false
	method image () = "mesa.png"
}
class MesaVertical {
	var property position
	method esAtravesable() = false
	method image () = "mesaVertical.png"
}
class MesaEsquinaDerecha {
	var property position 
	method esAtravesable() = false
	method image () = "mesaEsquinaDerecha.png"
}
class MesaEsquinaIzquierda {
	var property position
	method esAtravesable() = false
	method image () = "mesaEsquinaIzquierda.png"
}
class ParedInvisible {
	var property position
	method esAtravesable() = false
	method image () = "muroinv.png"
}
object mesa {
	method generar(){
		var mesaHorizontal = []
		var mesavertical = []
		(5 .. 20).forEach{ n => mesaHorizontal.add(new Position(x=n, y=10)) }
		mesaHorizontal.forEach { p => game.addVisual(new Mesa(position = p))}
		(11 .. 13).forEach{ n => mesavertical.add(new Position(x=4, y=n)) }
		(11 .. 13).forEach{ n => mesavertical.add(new Position(x=21, y=n)) }
		mesavertical.forEach { p => game.addVisual(new MesaVertical(position = p))}
		game.addVisual(new MesaEsquinaDerecha(position = new Position(x=21, y=10)))
		game.addVisual(new MesaEsquinaIzquierda(position = new Position(x=4, y=10)))
	}
}
object paredes {
	
/*(0 .. ancho o largo) genera una lista con los números entre 0 y la última celda a lo ancho o alto. 
Después el forEach va generando las paredes que quedan ubicadas en los bordes y agregandolas a una
lista de posiciones. Por último posParedes.forEach... genera los objetos pared en dichas 
posiciones */

	method generar(){
		const ancho = game.width() - 1
		const largo = game.height() - 1

		var posParedes = []
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=-1)) }
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=largo)) }
		(0 .. largo).forEach{ n => posParedes.add(new Position(x=0, y=n)) }
		(0 .. largo).forEach{ n => posParedes.add(new Position(x=ancho, y=n)) }
		(3 .. 6).forEach{ n => posParedes.add(new Position(x=n, y=5)) }
		(3 .. 6).forEach{ n => posParedes.add(new Position(x=n, y=4)) }
		(3 .. 6).forEach{ n => posParedes.add(new Position(x=n, y=3)) }
		(3 .. 6).forEach{ n => posParedes.add(new Position(x=n, y=2)) }
		(19 .. 22).forEach{ n => posParedes.add(new Position(x=n, y=5)) }
		(19 .. 22).forEach{ n => posParedes.add(new Position(x=n, y=4)) }
		(19 .. 22).forEach{ n => posParedes.add(new Position(x=n, y=3)) }
		(19 .. 22).forEach{ n => posParedes.add(new Position(x=n, y=2)) }
		posParedes.forEach { p => game.addVisual(new ParedInvisible(position = p))}	
	}
}
object paredesMenu {
	method generar(){
		const ancho = game.width() 
		const largo = game.height() 
		var posParedes = []
		(0 .. 9).forEach{ n => posParedes.add(new Position(x=n, y=0)) }
		(0 .. 9).forEach{ n => posParedes.add(new Position(x=n, y=3)) }
		(0 .. 2).forEach{ n => posParedes.add(new Position(x=-3, y=n)) }
		(0 .. 2).forEach{ n => posParedes.add(new Position(x=9, y=n)) }
		posParedes.forEach { p => game.addVisual(new ParedInvisible(position = p))}
	}
}
