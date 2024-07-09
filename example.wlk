class Habitante {
  var property inteligencia = 0
  var property valentia = 0

  method poder() {
    return valentia + inteligencia
}
}

class Planeta {
  const poblacion = []

  method poder() = poblacion.sum{h => h.poder()}
}

class Soldado inherits Habitante {
  const armas = []

    method agarrarArma(nueva) {
      armas.add(nueva)
    }

    override method poder() = super() + self.potenciaArmas()

    method potenciaArmas() = armas.filter{a=>a.util()}.sum{a=>a.potencia()}
}