
class Planeta {
  const habitantes = []
  var museos = 0
  var murallas = 0

  method delegacionDiplomatica() = habitantes.filter{h => h.esDestacada()}
  method esCulto() = museos>=2 and habitantes.all{h => h.inteligencia()>=10}
  method potenciaReal() = habitantes.sum{h => h.potencia()}

  method murallas() = murallas

  method construirMurallas(km) {
    murallas += km
  }
  method fundarMuseo() {
    museos += 1
  }

  method potenciaAparente() = habitantes.max{h => h.potencia()} * habitantes.size()
  method necesitaReforzarse() = self.potenciaAparente() >= self.potenciaReal()*2

  method apaciguarA(otroPlaneta) {
    habitantes.filter{h => h.esDestacada()}.forEach{h => h.tributoA(otroPlaneta)}
  }
}

class Persona {
  const property edad = 0

  method potencia() = 20

  method inteligencia() = if (edad.between(20, 40)) 12 else 8

  method esDestacada() = edad==25 or edad==35

  method tributoA(planeta) = null

}

class Atleta inherits Persona {
  var masaMuscular = 4
  var tecnicas = 2

  override method potencia() = super() + masaMuscular*tecnicas
  override method esDestacada() = super() or tecnicas>5

  method entrenar(dias) = masaMuscular + dias.div(5)
  
  method aprenderTecnica() {
    tecnicas += 1
  }

  override method tributoA(planeta) = planeta.construirMurallas(2)

}

class Docente inherits Persona {
  var cursosDados = 0

  override method inteligencia() = super() + cursosDados*2
  override method esDestacada() = cursosDados>3
  override method tributoA(planeta) = planeta.fundarMuseo()
    
}

class Soldado inherits Persona {
  const armas = #{}

  override method potencia() = super() + armas.sum{a => a.potencia()}

  method agregarArma(arma) {
    armas.add(arma)
  }

  override method tributoA(planeta) = planeta.construirMurallas(5)
}

class Pistolete {
  const largo = 0

  method potencia(soldado) = if (soldado.edad()>30) largo*3 else largo*2
}

class Espadon {
  const peso = 0

  method potencia(soldado) = if (soldado.edad()<40) peso/2 else 6
}