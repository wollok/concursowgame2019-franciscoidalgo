import wollok.game.*
import personaje.*
import pared.*
import bloques_especiales.*
import direcciones.*
import npc.*
import batalla.*

object juego{
	
	method cargarNivel(){
		game.title("Juego123")
		game.height(15)
		game.width(25)
		game.boardGround("fondo.png")
		game.addVisual(pj)
		game.addVisual(raul)
		game.addVisual(profJorge)
		game.addVisual(norberto)
		game.addVisual(pokemonesLocos)
		game.addVisual(oracio)
		game.addVisual(segundaForTheWin)
		game.addVisual(dragonDude)
		game.addVisual(enfermeraMarta)
//		teleports.generar()
		paredes.generar()
		mesa.generar()
		keyboard.up().onPressDo{pj.ir(arriba)}
		keyboard.down().onPressDo{pj.ir(abajo)}
		keyboard.left().onPressDo{pj.ir(izquierda)}
		keyboard.right().onPressDo{pj.ir(derecha)}
		keyboard.z().onPressDo({pj.interactuar()})
	}
}