object caramelosInsuficientes inherits Exception {
	
}

object noComeCaramelosException inherits Exception {
	
} //class NoComeCaramelosException inherits Exception {}

class Chico {
	var caramelos
	const salud = sano
	const actitud
	const elementos = []
	
	method caramelos() = caramelos
	
	method capacidadSusto() = self.actitud() * self.sustoElementos()
	
	method recibirCaramelos(cantidad) {
		caramelos += cantidad
	}
	
	method ponerse(elemento) {
		elementos.add(elemento)
	}
	
	method actitud() = actitud * salud.coeficiente()
	
	method comerCaramelos(cant) {
		if (cant > caramelos) {
			throw caramelosInsuficientes
		}
		salud.comerCaramelos(cant, self)
		caramelos -= cant
	}
	
	method sustoElementos() = elementos.sum({ e => e.capacidadSusto() })
}

object maquillaje {
	var capacidadSusto = 3
	
	method capacidadSusto() = capacidadSusto
	
	method capacidadSusto(susto) {
		capacidadSusto = susto
	}
}

class TrajeTierno {
	method capacidadSusto() = 2
}

class TrajeTerrorifico {
	method capacidadSusto() = 5
}

object sano {
	method coeficiente() = 1
	
	method comerCaramelos(cantidad, chico) {
		if (cantidad > 10) chico.salud(empachado)
	}
}

object empachado {
	method coeficiente() = 0.5
	
	method comerCaramelos(cantidad, chico) {
		if (cantidad > 10) chico.salud(enCama)
	}
}

object enCama {
	method coeficiente() = 0
	
	method comerCaramelos(cantidad, chico) {
		throw noComeCaramelosException
	}
}