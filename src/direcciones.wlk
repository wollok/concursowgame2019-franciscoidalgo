object izquierda {
	
	method opuesta() = derecha
	method image() {
		return "izquierda.png"
	}
	method avanzar (position,cantidad) {
		return position.left(cantidad)
	}
}

object derecha {
	
	method opuesta() = izquierda
	method image() {
		return "derecha.png"
	}
	
	method avanzar (position,cantidad) {
		return position.right(cantidad)
	}
}

object arriba {

	method opuesta() = abajo
	method image() {
		return "arriba.png"
	}
	
	method avanzar (position,cantidad) {
		return position.up(cantidad)
	}
}

object abajo {

	method opuesta() = arriba
	method image() {
		return "abajo.png"
	}
	
	method avanzar (position,cantidad) {
		return position.down(cantidad)
	}
}