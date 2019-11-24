import move.*

class Tipo {
	var debilidades = []
	var resistencias = []
	var inmunidades = []
	method calcularMultiplicador (damagetype) {
		if (debilidades.contains(damagetype)) return 2
		if (resistencias.contains(damagetype)) return 0.5
		if (inmunidades.contains(damagetype)) return 0
		return 1
	}
}

object normal inherits Tipo (
	debilidades = [fighting], 
	inmunidades = [ghost]
){}

object fighting inherits Tipo (
	debilidades = [normal,flying,psychic,fairy], 
	resistencias = [rock,bug,dark]
){}

object flying inherits Tipo(
	debilidades = [rock,electric,ice],
	resistencias = [fighting,bug,grass],
	inmunidades = [ground]
){}

object poison inherits Tipo(
	debilidades = [ground,psychic],
	resistencias = [fighting,poison,bug,grass,fairy]
){}

object ground inherits Tipo(
	debilidades = [water,grass,ice],
	resistencias = [poison,rock],
	inmunidades = [electric]
){}

object rock inherits Tipo(
	debilidades = [fighting,steel,water,grass],
	resistencias = [normal,flying,poison,fire]
){}

object bug inherits Tipo(
	debilidades = [flying,rock,fire],
	resistencias = [fighting,ground,grass]
){}

object ghost inherits Tipo(
	debilidades = [ghost,dark],
	resistencias = [poison,bug],
	inmunidades = [normal, fighting]
){}

object steel inherits Tipo(
	debilidades = [fighting,ground,fire],
	resistencias = [normal,fighting,rock,bug,steel,grass,psychic,ice,dragon,fairy],
	inmunidades = [poison]
){}

object fire inherits Tipo(
	debilidades = [ground,rock,water],
	resistencias = [bug,steel,fire,grass,ice,fairy]
){}

object water inherits Tipo(
	debilidades = [grass,electric],
	resistencias = [steel,fire,water,ice]
){}

object grass inherits Tipo(
	debilidades = [flying,poison,bug,fire,ice],
	resistencias = [ground,water,grass,electric]
){}
object electric inherits Tipo(
	debilidades = [ground],
	resistencias = [flying,steel,electric]
){}

object psychic inherits Tipo(
	debilidades = [bug,ghost,dark],
	resistencias = [fighting, psychic]
){}

object ice inherits Tipo(
	debilidades = [fighting,rock,steel,fire],
	resistencias = [ice]
){}

object dragon inherits Tipo(
	debilidades = [ice,dragon,fairy],
	resistencias = [fire,water,grass,electric]
){}
object dark inherits Tipo(
	debilidades = [fighting,bug,fairy],
	resistencias = [ghost, dark],
	inmunidades = [psychic]
){}

object fairy inherits Tipo(
	debilidades = [poison,steel],
	resistencias = [fighting,bug,dark],
	inmunidades = [dragon]
){}
object nulo inherits Tipo(
	inmunidades = []
){}