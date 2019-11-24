import wollok.game.*
import personaje.*
import direcciones.*
import pokedex.*
import move.*
import batalla.*
import Tipos.*

class Npc{
	var property pokemonTeam = []
	var property direccion = izquierda
	var property ocupado = false
	method esAtravesable() = false
	method mirarPj (){
		direccion = pj.direccion().opuesta()
	}
	method hablar(mensaje){
		self.mirarPj()
		game.say(self,mensaje)
	}
	method agregarPokemon(poke){
		poke.statsBase()
		pokemonTeam.add(poke)
		}
}


object enfermeraMarta inherits Npc{
	method position () = game.at(12,6)
	method image () = "marta_" + direccion.image()
	method interactuar (){
		pj.ocupado(true)
		self.hablar("Dejame curar tus pokemons, esta vuelta es gratis")
		game.schedule(2000, {pj.ocupado(false)})
		pj.pokemonTeam().forEach{pokemon=>pokemon.recuperarse()}
	}
}

object raul inherits Npc{
	var property perdio = false
	var property iq = 25

	method PokemonTeam(){
		self.agregarPokemon(new Nidoking(side="enemy",owner=self))
		self.agregarPokemon(new Torkoal(side="enemy",owner=self))
		self.agregarPokemon(new Nidoking(side="enemy",owner=self))
	}
	method image () = "pj_" + direccion.image()
	method position () = game.at(2,4)
	method interactuar (){
		pj.ocupado(true)
		if (!perdio){
			self.hablar("!!!")
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Bien jugado...")
			pj.agregarPokemon(new Torkoal(owner=pj))
			game.schedule(2000,{pj.ocupado(false)})
		}
	}
}

object profJorge inherits Npc{
	method image () = "pj_" + direccion.image()
	method position () = game.at(9,7)
	method interactuar (){
		pj.ocupado(true)
		self.hablar("Toma tu primer pokemon team")
		pj.agregarPokemon(new Nidoking(owner=pj))
		pj.agregarPokemon(new Torkoal(owner=pj))
		pj.agregarPokemon(new Feraligatr(owner=pj))
		game.schedule(2000,{pj.ocupado(false)})
	}
}

object norberto inherits Npc{
	var property perdio = false
	var property iq = 75

	method PokemonTeam(){
		self.agregarPokemon(new Scyther(side="enemy",owner=self))
		self.agregarPokemon(new Magnezone(side="enemy",owner=self))
		self.agregarPokemon(new Breloom(side="enemy",owner=self))
		self.agregarPokemon(new Mawile(side="enemy",owner=self))
	}
	method image () = "pj_" + direccion.image()
	method position () = game.at(7,3)
	method interactuar (){
		pj.ocupado(true)
		if (!perdio){
			self.hablar("Me has visto")
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
		}else{
			self.hablar("Demonios...")
			game.schedule(2000,{pj.ocupado(false)})
			self.hablar("Adelante quedate mi pokemon, te lo ganaste")
			pj.agregarPokemon(new Mawile(owner=pj))
			game.schedule(2000,{pj.ocupado(false)})
		}
	}
}

object pokemonesLocos inherits Npc{
	var property perdio = false
	var property iq = 30

	method PokemonTeam(){
		self.agregarPokemon(new Beedrill(side="enemy",owner=self))
		self.agregarPokemon(new Mimikyu(side="enemy",owner=self))
		self.agregarPokemon(new Pikachu(side="enemy",owner=self))
		self.agregarPokemon(new Feraligatr(side="enemy",owner=self))
	}
	method image () = "pj_" + direccion.image()
	method position () = game.at(5,6)
	method interactuar (){
		pj.ocupado(true)
		if (!perdio){
			self.hablar("Tiempo de un DDDDDDDDDDDDuelo")
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
		}else{
			self.hablar("los pokemones de mi abuelo...")
			game.schedule(2000,{pj.ocupado(false)})
		}
	}
}

object oracio inherits Npc{
	var property perdio = false
	var property iq = 80
	
	method PokemonTeam(){
		self.agregarPokemon(new Gardevoir(side="enemy",owner=self))
		self.agregarPokemon(new Muk(side="enemy",owner=self))
		self.agregarPokemon(new Garchomp(side="enemy",owner=self))
		self.agregarPokemon(new Metagross(side="enemy",owner=self))
	}
	method image () = "pj_" + direccion.image()
	method position () = game.at(20,1)
	method interactuar (){
		pj.ocupado(true)
		if (!perdio){
			self.hablar("Jamas ganaras")
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
		}else{
			self.hablar("como puede haber susedido esto...")
			game.schedule(2000,{pj.ocupado(false)})
		}
	}
}

object segundaForTheWin inherits Npc{
	var property perdio = false
	var property iq = 90

	method PokemonTeam(){
		self.agregarPokemon(new Noctowl(side="enemy",owner=self))
		self.agregarPokemon(new Mightyena(side="enemy",owner=self))
		self.agregarPokemon(new Houndoom(side="enemy",owner=self))
		self.agregarPokemon(new HoOh(side="enemy",owner=self))
	}
	method image () = "pj_" + direccion.image()
	method position () = game.at(21,1)
	method interactuar (){
		pj.ocupado(true)
		if (!perdio){
			self.hablar("Segunda Gen es lo massssss")
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
		}else{
			self.hablar("no vivo de la nostalgia...")
			pj.agregarPokemon(new Houndoom(owner=pj))
			game.schedule(2000,{pj.ocupado(false)})
		}
	}
}
object dragonDude inherits Npc{
	var property perdio = false
	var property iq = 100

	method PokemonTeam(){
		self.agregarPokemon(new Dragonite(side="enemy",owner=self))
		self.agregarPokemon(new Altaria(side="enemy",owner=self))
		self.agregarPokemon(new Kingdra(side="enemy",owner=self))
	}
	method image () = "pj_" + direccion.image()
	method position () = game.at(18,3)
	method interactuar (){
		pj.ocupado(true)
		if (!perdio){
			self.hablar("Poder Dragon!!!")
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
		}else{
			self.hablar("poder dragon...")
			pj.agregarPokemon(new Dragonite(owner=pj))
			game.schedule(2000,{pj.ocupado(false)})
		}
	}
}