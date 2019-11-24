import wollok.game.*
import move.*
import Tipos.*
import batalla.*
import npc.*

class Pokemon{
	var property owner=self
	var property name=""
	var property hp=0
	var property atk=0
	var property def=0
	var property spa=0
	var property spd=0
	var property spe=0
	var property types=[nulo,nulo]
	var property moveset = []
	var side="ally"
	var property hpActual=1
	method image () = name + side + ".png"
	method position (){
		if (side == "ally"){
			return game.at(5,4)
		}else{
			return game.at(15,7)
		}
	}
	method posicionDeLaVida (){
		if (side == "ally"){
			return game.at(1,11)
		}else{
			return game.at(21,13)
		}
	}
	method estaVivo () = hpActual != 0
	method recuperarse(){
		hpActual = hp
	}
	method elAtaqueAcerto (ataque, objetivo) = (1 .. 100).anyOne() <= ataque.accuracy()
	method atacar(ataque,objetivo){
		self.owner().ocupado(true)
		game.say(self, name + " ha usado " + ataque.name())
		if (self.elAtaqueAcerto(ataque, objetivo)){
			objetivo.recibirDanio (ataque,self)	
		}
		else{
			game.schedule(2000,{game.say(objetivo,objetivo.name()+" esquivo el ataque.")})
			game.schedule(6000,{owner.ocupado(false)})
		}
	}
	
	method recibirDanio (ataque,pokemon){
		hpActual = (hpActual - self.danio(ataque,pokemon)).max(0)
		game.schedule(2000,{vida.dibujarVidaDe(self)})
		if (self.hpActual() == 0){
				game.schedule(4000,{game.say(self, self.name() + " no puede continuar.")})
				game.schedule(6500,{batalla.pokemonKO(self)})
		} else game.schedule(6000,{pokemon.owner().ocupado(false)})
	}
	method danio(ataque,pokemon){
		return (((((2*100*0.5+2)*ataque.dmg()*ataque.type().conQueAtacar(pokemon)/ataque.type().conQueDefenderse(self))*0.02)+2)*self.calcularMultiplicador(ataque,pokemon)).div(2)
	}
	
	method calcularEficacia(ataque){
		var multiplicador = 1
		self.types().forEach({tipo=>multiplicador*=tipo.calcularMultiplicador (ataque.damagetype())})
		return multiplicador
	}
	method calcularMultiplicador(ataque,pokemon){
		var multiplicador= self.calcularEficacia(ataque)
		if (multiplicador == 0) game.schedule(2000,{game.say(self,"Es inmune.")})else{
			if (multiplicador >= 2) game.schedule(2000,{game.say(self,"Es super efectivo!")})
			if (multiplicador <= 0.5) game.schedule(2000,{game.say(self,"No es muy efectivo...")})
			if(multiplicador < 2 && multiplicador > 0.5) game.schedule(2000,{game.say(self,"Tu ataque dio en el blanco.")})
		}
		if (pokemon.types().contains(ataque.damagetype())) multiplicador *= 1.5
		multiplicador *= new Range(start = 85, end = 100).anyOne() / 100
		return multiplicador
	}
	
	method calcularStat (stat) = 2*stat+ (20 .. 31).anyOne()
	
	method stats(){
		hp= self.calcularStat(hp) + 110
		atk= self.calcularStat(atk) + 5
		def = self.calcularStat(def) + 5
		spa = self.calcularStat(spa) + 5
		spd = self.calcularStat(spd) + 5
		spe = self.calcularStat(spe) + 5
		hpActual=hp 
	}
}
class Nidoking inherits Pokemon{
	method statsBase(){
		name ="Nidoking"
		hp  =81
		atk =102
		def =77
		spa =85
		spd =75 
		spe =85
		types=[ground,poison]
		moveset = [earthquake,icepunch,rocktomb,poisonjab]
		self.stats()
	}
}

class Scyther inherits Pokemon{
	method statsBase () {
		name ="Scyther"
		hp  =70
		atk =110
		def =80
		spa =55
		spd =80 
		spe =105
		types=[bug,flying]
		moveset = [nigthSlash,xScissors,aerialAce,bugBite]
		self.stats()
	}
}

class Torkoal inherits Pokemon{
	method statsBase () {
		name ="Torkoal"
		hp  =70
		atk =85
		def =140
		spa =85
		spd =70 
		spe =20
		types=[fire]

		moveset = [flameThrower,sludgeBomb,rapidSpin,lavaPlume]
		self.stats()
	}
}

class Breloom inherits Pokemon{
	method statsBase () {
		name ="Breloom"
		hp  =70
		atk =130
		def =80
		spa =60
		spd =70 
		spe =70
		types=[fighting,grass]
		moveset = [machPunch,bulletSeed,stoneEdge,seedBomb]
		self.stats()
	}
}

class Magnezone inherits Pokemon{
	method statsBase () {
		name ="Magnezone"
		hp  =70
		atk =70
		def =115
		spa =130
		spd =90 
		spe =60
		types=[electric,steel]
		moveset = [thunderbolt,flashCannon,spark,mirrorShot]
		self.stats()
	}
}
class Mawile inherits Pokemon{
	method statsBase () {
		name ="Mawile"
		hp  =50
		atk =85
		def =85
		spa =50
		spd =55
		spe =55
		types=[steel,fairy]
		moveset = [playRought,ironHead,fireFang,focusPunch]
		self.stats()
	}
}

class Beedrill inherits Pokemon{
	method statsBase () {
		name ="Beedrill"
		hp  =65
		atk =90
		def =40
		spa =75
		spd =45
		spe =70
		types=[bug,flying]
		moveset = [poisonjab,xScissors,drillRun,brickBreack]
		self.stats()
	}
}

class Mimikyu inherits Pokemon{
	method statsBase () {
		name ="Mimikyu"
		hp  =55
		atk =90
		def =80
		spa =50
		spd =105
		spe =96
		types=[ghost,fairy]
		moveset = [playRought,shadowSneak,woodHammer,nigthSlash]
		self.stats()
	}
}

class Pikachu inherits Pokemon{
	method statsBase () {
		name ="Pikachu"
		hp  =35
		atk =55
		def =40
		spa =50
		spd =50
		spe =90
		types=[electric,nulo]
		moveset = [focusPunch,thunderbolt,surf,grassKnot]
		self.stats()
	}
}

class Feraligatr inherits Pokemon{
	method statsBase () {
		name ="Feraligatr"
		hp  =85
		atk =105
		def =100
		spa =78
		spd =79
		spe =83
		types=[water,nulo]
		moveset = [earthquake,surf,icepunch,crunch]
		self.stats()
	}
}
class Gardevoir inherits Pokemon{
	method statsBase () {
		name ="Gardevoir"
		hp  =68
		atk =65
		def =65
		spa =125
		spd =115
		spe =80
		types=[psychic,fairy]
		moveset = [shadowBall,hyperVoice,psyShock,focusBlast]
		self.stats()
	}
}
class Metagross inherits Pokemon{
	method statsBase () {
		name ="Metagross"
		hp  =80
		atk =135
		def =130
		spa =95
		spd =90
		spe =70
		types=[steel,psychic]
		moveset = [meteorMash,zenHeadbutt,icepunch,hammerArm]
		self.stats()
	}
}
class Garchomp inherits Pokemon{
	method statsBase () {
		name ="Garchomp"
		hp  =108
		atk =130
		def =95
		spa =80
		spd =85
		spe =102
		types=[dragon,ground]
		moveset = [earthquake,stoneEdge,dragonClaw,rockSlide]
		self.stats()
	}
}
class Muk inherits Pokemon{
	method statsBase () {
		name ="Muk"
		hp  =105
		atk =105
		def =75
		spa =65
		spd =100
		spe =50
		types=[poison,nulo]
		moveset = [poisonjab,shadowPunch,gunkShot,focusPunch]
		self.stats()
	}
}
class Dragonite inherits Pokemon{
	method statsBase () {
		name ="Dragonite"
		hp  =91
		atk =134
		def =95
		spa =100
		spd =100
		spe =80
		types=[dragon,flying]
		moveset = [earthquake,dragonClaw,ironHead,firePunch]
		self.stats()
	}
}
class Noctowl inherits Pokemon{
	method statsBase () {
		name ="Noctowl"
		hp  =100
		atk =50
		def =50
		spa =86
		spd =96
		spe =70
		types=[normal,flying]
		moveset = [psyShock,aerialAce,zenHeadbutt,steelWing]
		self.stats()
	}
}
class Mightyena inherits Pokemon{
	method statsBase () {
		name ="Mightyena"
		hp  =70
		atk =90
		def =70
		spa =60
		spd =60
		spe =70
		types=[dark,nulo]
		moveset = [crunch,fireFang,iceFang,thunderFang]
		self.stats()
	}
}
class Houndoom inherits Pokemon{
	method statsBase () {
		name ="Houndoom"
		hp  =75
		atk =90
		def =50
		spa =110
		spd =80
		spe =95
		types=[dark,fire]
		moveset = [crunch,fireBlast,suckerPunch,pursuit]
		self.stats()
	}
}
class Kingdra inherits Pokemon{
	method statsBase () {
		name ="Kingdra"
		hp  =75
		atk =95
		def =95
		spa =95
		spd =95
		spe =85
		types=[water,dragon]
		moveset = [surf,iceBeam,hydroPump,dracoMeteor]
		self.stats()
	}
}
class HoOh inherits Pokemon{
	method statsBase () {
		name ="Ho-Oh"
		hp  =106
		atk =130
		def =90
		spa =110
		spd =154
		spe =90
		types=[fire,flying]
		moveset = [earthquake,braveBird,sacredFire,flameThrower]
		self.stats()
	}
}
class Altaria inherits Pokemon{
	method statsBase () {
		name ="Altaria"
		hp  =75
		atk =70
		def =90
		spa =80
		spd =70
		spe =105
		types=[dragon,flying]
		moveset = [earthquake,hyperVoice,dracoMeteor,dragonClaw]
		self.stats()
	}
}