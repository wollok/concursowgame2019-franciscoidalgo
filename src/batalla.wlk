import wollok.game.*
import personaje.*
import juego.*
import pared.*
import direcciones.*
import pokedex.*
import move.*
import displayNumero.*

object batalla {
	var property pokemonEnemigo  = new Pokemon()
	var property pokemonAliado = new Pokemon()
	var pokemonsEnemigos
	var property enemigo

	method iniciar (npc){
		game.clear()
		pj.ocupado(false)
		enemigo = npc
		pokemonsEnemigos = enemigo.pokemonTeam()
		pokemonEnemigo = pokemonsEnemigos.first()
		paredesMenu.generar()
		game.addVisual(new ElementoInterfaz(image="background.png", position = game.at(0,0)))
		game.addVisual(new ElementoInterfaz(image="menu2.png", position = game.at(0,0)))
		if(pj.pokemonsVivos().isEmpty()){
			self.terminar()
			throw new Exception(message= "No tenes nigun pokemon para pelear")
		}
		pokemonAliado = pj.pokemonsVivos().first()
		game.addVisual(pokemonAliado)
		game.addVisual(move1)
		game.addVisual(move2)
		game.addVisual(move3)
		game.addVisual(move4)
		self.actualizarMoveset()
		game.addVisual(pokemonEnemigo)
		game.addVisual(seleccionarSkill)
//		vida.fijarCifras(3)							  Por definir si la cantidad de cifras siempre es tres, mostrando ceros
		vida.dibujarVidaDe(pokemonAliado)			//a la izquierda, o dejamos que sean las de la hp del pokemon
		vida.dibujarVidaDe(pokemonEnemigo)
		keyboard.up().onPressDo{seleccionarSkill.irVertical(arriba)}
		keyboard.down().onPressDo{seleccionarSkill.irVertical(abajo)}
		keyboard.left().onPressDo{seleccionarSkill.irHorizontal(izquierda)}
		keyboard.right().onPressDo{seleccionarSkill.irHorizontal(derecha)}
		keyboard.z().onPressDo{seleccionarSkill.interactuar()}
		keyboard.x().onPressDo{seleccionarSkill.atras()}
		keyboard.u().onPressDo({self.terminar()})
	}
	
	method actualizarMoveset (){
		move1.actualizar()
		move2.actualizar()
		move3.actualizar()
		move4.actualizar()
	}
	
	method pokemonKO (quePokemon){
		var pokemonRestantes
		if (quePokemon == pokemonEnemigo){
			pokemonRestantes = pokemonsEnemigos.filter({pokemon=>pokemon.estaVivo()})
			if (pokemonRestantes.isEmpty()){
				enemigo.perdio(true)
				self.terminar()
			} 	else{
				game.removeVisual(pokemonEnemigo)
				pokemonEnemigo = pokemonRestantes.first()
				game.addVisual(pokemonEnemigo)
				vida.dibujarVidaDe(pokemonEnemigo)
				pj.ocupado(false)
			}
		}else{
			pokemonRestantes = pj.pokemonTeam().filter({pokemon=>pokemon.estaVivo()})
			if(pokemonRestantes.isEmpty()) self.terminar()	else{
				game.removeVisual(pokemonAliado)
				pokemonAliado = pokemonRestantes.first()
				game.addVisual(pokemonAliado)
				vida.dibujarVidaDe(pokemonAliado)
				self.actualizarMoveset()
				enemigo.ocupado(false)
			}
		}
	}
	
	method terminar(){
		enemigo.pokemonTeam().forEach{pokemon=>pokemon.recuperarse()}
		game.clear()
		juego.cargarNivel()
		pj.ocupado(false)
	}
	
	method elPokemonMasRapido() {
		if (pokemonEnemigo.spe() > pokemonAliado.spe()) return pokemonEnemigo else return pokemonAliado 
	}
	
	method elPokemonMasLento(){
		if (pokemonEnemigo.spe() <= pokemonAliado.spe()) return pokemonEnemigo else return pokemonAliado 		
	}
}

class ElementoInterfaz{
	var property image
	var property position = game.origin()
}

class Move{
	var property esMove = true
	var property nombre
	var numero
	var property position
	method image () = nombre.image()
	method esAtravesable () = true
	method actualizar () {
		nombre = batalla.pokemonAliado().moveset().get(numero)
	}
}

object move1 inherits Move (
	nombre = batalla.pokemonAliado().moveset().get(0),
	numero = 0,
	position = game.at(1,2)
){}

object move2 inherits Move (
	nombre = batalla.pokemonAliado().moveset().get(1),
	numero = 1,
	position = game.at(5,1)
){}

object move3 inherits Move (
	nombre = batalla.pokemonAliado().moveset().get(2),
	numero = 2,
	position = game.at(1,1)
){}

object move4 inherits Move (
	nombre = batalla.pokemonAliado().moveset().get(3),
	numero = 3,
	position = game.at(5,2)
){}

object seleccionarSkill{
	var property position = game.at(1,2)
	var property direccion = izquierda
	method image() = "selec.png"
	method irHorizontal(nuevaDireccion){
			direccion = nuevaDireccion
			self.moverse(4)
		
	}
	method irVertical(nuevaDireccion){
			direccion = nuevaDireccion
			self.moverse(1)
		
	}
	

	method moverse (cantidad){
		if(!pj.ocupado() && !batalla.enemigo().ocupado() && game.getObjectsIn(direccion.avanzar(position,cantidad)).all({objeto => objeto.esAtravesable()})){
			position = direccion.avanzar(position,cantidad)
		}
	}
	
	method interactuar (){
		if (!pj.ocupado() && !batalla.enemigo().ocupado()){
			batalla.elPokemonMasRapido().owner().ocupado(true)
			batalla.elPokemonMasRapido().atacar(self.deducirAtaque(batalla.elPokemonMasRapido()),batalla.elPokemonMasLento())
			game.schedule(6000,{if(!batalla.elPokemonMasRapido().owner().ocupado())batalla.elPokemonMasLento().atacar(self.deducirAtaque(batalla.elPokemonMasLento()),batalla.elPokemonMasRapido())})
		}
	}
	method deducirAtaque(quienAtaca){
		if (quienAtaca == batalla.pokemonAliado()) return game.getObjectsIn(position).find({elemento=>elemento.esMove()}).nombre() else {
			if ((1 .. 100).anyOne() <= batalla.pokemonEnemigo().owner().iq()){
				return batalla.pokemonEnemigo().moveset().max({ataque=>batalla.pokemonAliado().calcularEficacia(ataque)})
			}
			var random = new Range (start = 0, end = batalla.pokemonEnemigo().moveset().size()-1).anyOne()
			return batalla.pokemonEnemigo().moveset().get(random)
		} 
	}
	
	method atras(){}
}


object vida inherits DisplayNumero{
	method dibujarVidaDe (quien){		
		self.mostrar(quien.hpActual(), quien.posicionDeLaVida())
	}
}