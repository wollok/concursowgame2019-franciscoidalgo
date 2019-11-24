import wollok.game.*
import personaje.*

class Teleport {
	var property position
	var property destino
	method image() = "muro.png"
	method esAtravesable() = true
}

object teleports{
	method generar() {
		var listaTps = []
		listaTps.add(new Teleport(position = new Position(x=4,y=4),destino = new Position(x=6, y=6)))
		listaTps.forEach {teleport=>game.addVisual(teleport)}
		listaTps.forEach{tp=>game.onCollideDo(tp,{npc=>npc.position(tp.destino())})}
	}
}