import wollok.game.*
import pared.*
import direcciones.*


object pj {
	var property pokemonTeam = []
	
	var property ocupado = false
	
	var property direccion = izquierda

	var property position = game.center()

	method image ()= "pj_" + direccion.image()
		
	method ir(nuevaDireccion){
		if(!ocupado){
			direccion = nuevaDireccion
			self.moverse()
		}
	}

	method moverse (){
		if(game.getObjectsIn(direccion.avanzar(position,1)).all({objeto => objeto.esAtravesable()})){
			position = direccion.avanzar(position,1)
		}
	}
	
	method interactuar (){
		game.getObjectsIn(direccion.avanzar(position,1)).forEach({npc=>if(!ocupado){npc.interactuar()}})
	}
	method agregarPokemon(poke){
		poke.statsBase()
		pokemonTeam.add(poke)
	}
	
	method pokemonsVivos (){
		return pokemonTeam.filter({pokemon=>pokemon.estaVivo()})
	}
}
