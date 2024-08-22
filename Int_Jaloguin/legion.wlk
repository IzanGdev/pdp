class Legion {
	const integrantes = []
	
	method capacidadSusto() = integrantes.sum(
		{ integrante => integrante.capacidadSusto() }
	)
	
	method agregarIntegrantes(nuevosIntegrantes) {
		integrantes.addAll(nuevosIntegrantes)
	}
	
	method lider() = integrantes.max({ integrante => integrante.capacidadSusto() })
	
	method caramelos() = integrantes.sum({ integrante => integrante.caramelos() })
	
	method recibirCaramelos(cantidad) {
		self.lider().recibirCaramelos(cantidad)
	}
}