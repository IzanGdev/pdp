object elNecioNoEntregaCaramelos inherits Exception {
	
}

class Adulto {
	const asustadores = []
	
	method serAsustadoPor(alguien) {
		if (self.seAsusta(alguien)) alguien.recibirCaramelos(
				self.caramelosAEntregar(alguien)
			)
		asustadores.add(alguien)
	}
	
	method seAsusta(alguien) = alguien.capacidadSusto() > self.tolerancia()
	
	method caramelosAEntregar(alguien) = self.tolerancia().div(2)
	
	method tolerancia() = 10 * asustadores.count({ c => c.caramelos() > 15 })
}

class Abuelo inherits Adulto {
	override method seAsusta(alguien) = true
	
	override method caramelosAEntregar(alguien) = super(alguien).div(2)
}

class Necio inherits Adulto {
	override method seAsusta(alguien) = false
	
	override method caramelosAEntregar(alguien) {
		throw elNecioNoEntregaCaramelos
	}
}