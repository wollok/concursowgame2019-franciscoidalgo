import pokedex.*
import personaje.*
import batalla.*
import Tipos.*

object ataqueFisico {
	method conQueAtacar(pokemonAtacante) = pokemonAtacante.atk()
	method conQueDefenderse (pokemonEnemigo) = pokemonEnemigo.def()
}

object ataqueEspecial {
	method conQueAtacar(pokemonAtacante) = pokemonAtacante.spa()
	method conQueDefenderse (pokemonEnemigo) = pokemonEnemigo.spd()
}

class Ataque{
	var property name
	var property type
	var property damagetype
	var property dmg
	var property efect
	var property accuracy
	var property priority
	method image () = name + ".png"
}
const earthquake= new Ataque(
	name = "earthquake",
	type = ataqueFisico,
	damagetype = ground,
	dmg = 100,
	efect= "nada",
	accuracy = 100,
	priority =false
	
)
const icepunch =new Ataque(
	name = "icepunch",
	type = ataqueFisico,
	damagetype = ice,
	dmg = 75,
	efect= "10% freeze",
	accuracy = 100,
	priority =false
)
const rocktomb =new Ataque(
	name = "rocktomb",
	type = ataqueFisico,
	damagetype = rock,
	dmg = 60,
	efect= "100%-1 spe",
	accuracy = 95,
	priority =false
)
const poisonjab =new Ataque(
	name = "poisonjab",
	type = ataqueFisico,
	damagetype = poison,
	dmg = 80,
	efect= "30% poison",
	accuracy = 100,
	priority =false
)
const nigthSlash =new Ataque(
	name = "nigthSlash",
	type = ataqueFisico,
	damagetype = dark,
	dmg = 70,
	efect= "nada",
	accuracy = 100,
	priority =false
)
const xScissors =new Ataque(
	name = "xScissors",
	type = ataqueFisico,
	damagetype = bug,
	dmg = 80,
	efect= "nada",
	accuracy = 100,
	priority =false
)
const aerialAce =new Ataque(
	name = "aerialAce",
	type = ataqueFisico,
	damagetype = flying,
	dmg = 60,
	efect= "nada",
	accuracy = 100,
	priority =false
)
const bugBite =new Ataque(
	name = "bugBite",
	type = ataqueFisico,
	damagetype = bug,
	dmg = 60,
	efect= "nada",
	accuracy = 100,
	priority =false
)
const sludgeBomb =new Ataque(
	name = "sludgeBomb",
	type = ataqueEspecial,
	damagetype = poison,
	dmg = 90,
	efect= "30% poison",
	accuracy = 100,
	priority =false
)
const rapidSpin =new Ataque(
	name = "rapidSpin",
	type = ataqueFisico,
	damagetype = normal,
	dmg = 20,
	efect= "nada",
	accuracy = 100,
	priority =false
)
const flameThrower =new Ataque(
	name = "flameThrower",
	type = ataqueEspecial,
	damagetype = fire,
	dmg = 90,
	efect= "10% burn",
	accuracy = 100,
	priority =false
)
const lavaPlume =new Ataque(
	name = "lavaPlume",
	type = ataqueEspecial,
	damagetype = fire,
	dmg = 80,
	efect= "30% burn",
	accuracy = 100,
	priority =false
)
const machPunch =new Ataque(
	name = "machPunch",
	type = ataqueFisico,
	damagetype = fighting,
	dmg = 40,
	efect= "nada",
	accuracy = 100,
	priority =true
)
const bulletSeed =new Ataque(
	name = "bulletSeed",
	type = ataqueFisico,
	damagetype = grass,
	dmg = 25,
	efect= "nada",
	accuracy = 100,
	priority =false
)
const stoneEdge =new Ataque(
	name = "stoneEdge",
	type = ataqueEspecial,
	damagetype = rock,
	dmg = 100,
	efect= "nada",
	accuracy = 80,
	priority =false
)
const thunderbolt =new Ataque(
	name = "thunderbolt",
	type = ataqueEspecial,
	damagetype = electric,
	dmg = 90,
	efect= "10% paralyze",
	accuracy = 100,
	priority =false
)
const flashCannon =new Ataque(
	name = "flashCannon",
	type = ataqueEspecial,
	damagetype = electric,
	dmg = 80,
	efect= "nada",
	accuracy = 100,
	priority =false
)
const spark =new Ataque(
	name = "spark",
	type = ataqueEspecial,
	damagetype = electric,
	dmg = 65,
	efect= "30% paralyze",
	accuracy = 100,
	priority =false
)
const seedBomb =new Ataque(
	name = "seedBomb",
	type = ataqueEspecial,
	damagetype = grass,
	dmg = 80,
	efect= "nada",
	accuracy = 100,
	priority =false
)
const mirrorShot =new Ataque(
	name = "mirrorShot",
	type = ataqueEspecial,
	damagetype = steel,
	dmg = 65,
	efect= "nada",
	accuracy = 85,
	priority =false
)
const playRought =new Ataque(
	name = "playRought",
	type = ataqueFisico,
	damagetype = fairy,
	dmg = 90,
	efect= "nada",
	accuracy = 90,
	priority =false
)
const ironHead =new Ataque(
	name = "IronHead",
	type = ataqueFisico,
	damagetype = steel,
	dmg = 80,
	efect= "10% retroceder",
	accuracy = 100,
	priority =false
)
const fireFang =new Ataque(
	name = "fireFang",
	type = ataqueFisico,
	damagetype = fire,
	dmg = 65,
	efect= "10% burn y 10% retroceder",
	accuracy = 95,
	priority =false
)
const focusPunch =new Ataque(
	name = "focusPunch",
	type = ataqueFisico,
	damagetype = fighting,
	dmg = 150,
	efect= "nada",
	accuracy = 100,
	priority =false
)
const drillRun =new Ataque(
	name = "drillRun",
	type = ataqueFisico,
	damagetype = ground,
	dmg = 80,
	efect= "nada",
	accuracy = 95,
	priority =false
)
const brickBreack =new Ataque(
	name = "brickBreack",
	type = ataqueFisico,
	damagetype = fighting,
	dmg = 75,
	efect= "destruye pantallas",
	accuracy = 100,
	priority =false
)
const shadowSneak =new Ataque(
	name = "shadowSneak",
	type = ataqueFisico,
	damagetype = dark,
	dmg = 40,
	efect= "nada",
	accuracy = 100,
	priority =true
)
const woodHammer =new Ataque(
	name = "woodHammer",
	type = ataqueFisico,
	damagetype = grass,
	dmg = 120,
	efect= "nada",
	accuracy = 100,
	priority =false
)
const surf =new Ataque(
	name = "surf",
	type = ataqueFisico,
	damagetype = water,
	dmg = 90,
	efect= "nada",
	accuracy = 100,
	priority =false
)
const grassKnot =new Ataque(
	name = "grassKnot",
	type = ataqueEspecial,
	damagetype = grass,
	dmg = 70,
	efect= "nada",
	accuracy = 100,
	priority =false
)
const crunch =new Ataque(
	name = "crunch",
	type = ataqueFisico,
	damagetype = dark,
	dmg = 80,
	efect= "nada",
	accuracy = 100,
	priority =false
)
const shadowBall =new Ataque(
	name = "shadowBall",
	type = ataqueEspecial,
	damagetype = dark,
	dmg = 80,
	efect= "nada",
	accuracy = 100,
	priority =false
)
const hyperVoice =new Ataque(
	name = "hyperVoice",
	type = ataqueEspecial,
	damagetype = normal,
	dmg = 90,
	efect= "nada",
	accuracy = 100,
	priority =false
)
const psyShock =new Ataque(
	name = "psyShock",
	type = ataqueEspecial,
	damagetype = psychic,
	dmg = 80,
	efect= "nada",
	accuracy = 100,
	priority =false
)
const focusBlast =new Ataque(
	name = "focusBlast",
	type = ataqueFisico,
	damagetype = fighting,
	dmg = 120,
	efect= "nada",
	accuracy = 70,
	priority =false
)
const meteorMash =new Ataque(
	name = "meteorMash",
	type = ataqueFisico,
	damagetype = steel,
	dmg = 90,
	efect= "nada",
	accuracy = 90,
	priority =false
)
const zenHeadbutt =new Ataque(
	name = "zenHeadbutt",
	type = ataqueFisico,
	damagetype = psychic,
	dmg = 80,
	efect= "nada",
	accuracy = 90,
	priority =false
)
const hammerArm =new Ataque(
	name = "hammerArm",
	type = ataqueFisico,
	damagetype = fighting,
	dmg = 100,
	efect= "nada",
	accuracy = 90,
	priority =false
)
const dragonClaw =new Ataque(
	name = "dragonCLaw",
	type = ataqueFisico,
	damagetype = dragon,
	dmg = 80,
	efect= "nada",
	accuracy = 100,
	priority =false
)
const rockSlide =new Ataque(
	name = "rockSlide",
	type = ataqueFisico,
	damagetype = rock,
	dmg = 75,
	efect= "30% retroceder",
	accuracy = 90,
	priority =false
)
const gunkShot =new Ataque(
	name = "gunkShot",
	type = ataqueEspecial,
	damagetype = poison,
	dmg = 120,
	efect= "30% retroceder",
	accuracy = 80,
	priority =false
)
const shadowPunch =new Ataque(
	name = "shadowPunch",
	type = ataqueFisico,
	damagetype = dark,
	dmg = 60,
	efect= "30% retroceder",
	accuracy = 100,
	priority =false
)
const firePunch =new Ataque(
	name = "firePunch",
	type = ataqueFisico,
	damagetype = fire,
	dmg = 75,
	efect= "30% retroceder",
	accuracy = 100,
	priority =false
)
const steelWing =new Ataque(
	name = "steelWing",
	type = ataqueFisico,
	damagetype = steel,
	dmg = 70,
	efect= "30% retroceder",
	accuracy = 90,
	priority =false
)
const iceFang =new Ataque(
	name = "iceFang",
	type = ataqueFisico,
	damagetype = ice,
	dmg = 65,
	efect= "10% congelar y 10% retroceder",
	accuracy = 95,
	priority =false
)
const thunderFang =new Ataque(
	name = "thunderFang",
	type = ataqueFisico,
	damagetype = electric,
	dmg = 65,
	efect= "10% paralize y 10% retroceder",
	accuracy = 95,
	priority =false
)
const pursuit =new Ataque(
	name = "pursuit",
	type = ataqueFisico,
	damagetype = dark,
	dmg = 40,
	efect= " nada",
	accuracy = 100,
	priority =false
)
const suckerPunch =new Ataque(
	name = "suckerPunch",
	type = ataqueFisico,
	damagetype = dark,
	dmg = 70,
	efect= "nada",
	accuracy = 100,
	priority =true
)
const fireBlast =new Ataque(
	name = "fireBlast",
	type = ataqueEspecial,
	damagetype = fire,
	dmg = 110,
	efect= "nada",
	accuracy = 85,
	priority =false
)
const iceBeam =new Ataque(
	name = "iceBeam",
	type = ataqueEspecial,
	damagetype = ice,
	dmg = 90,
	efect= "nada",
	accuracy = 100,
	priority =false
)
const hydroPump =new Ataque(
	name = "hydroPump",
	type = ataqueEspecial,
	damagetype = water,
	dmg = 110,
	efect= "nada",
	accuracy = 80,
	priority =false
)
const dracoMeteor =new Ataque(
	name = "dracoMeteor",
	type = ataqueEspecial,
	damagetype = dragon,
	dmg = 130,
	efect= "nada",
	accuracy = 90,
	priority =false
)
const sacredFire =new Ataque(
	name = "sacredFire",
	type = ataqueEspecial,
	damagetype = fire,
	dmg = 100,
	efect= "nada",
	accuracy = 95,
	priority =false
)
const braveBird =new Ataque(
	name = "braveBird",
	type = ataqueFisico,
	damagetype = flying,
	dmg = 120,
	efect= "nada",
	accuracy = 10,
	priority =false
)