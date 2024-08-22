class Barrio {
	const chicos
	
	method elementosUsados() = chicos.filter(
		{ chico => chico.masDeNCaramelos(10) }
	).flatmap({ chico => chico.elementos() }).asSet()
	
	method chicosConMasCaramelos() = chicos.sortedBy(
		{ chico1, chico2 => chico1.caramelos() > chico2.caramelos() }
	).take(3)
}