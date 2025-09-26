import cosas.*
object camion {

const carga = []

    method cargar(unaCosa) {
      carga.add(unaCosa)
    }
    method descargar(unaCosa) {
      carga.remove(unaCosa)
    }

    method pesoTotal() = 1000 + carga.sum({c=>c.peso()})
    // el metodo even, evalua si el numero es par
    /*
        PODRIA HACERSE ASI, PERO SE USARIA DE OTRA FORMA, MAS POLIFORMICA
    method todaCargaesPar() = carga.all({c=>c.peso().even()})
    */
    method todaCargaesPar() = carga.all({c=>c.esPesoPar()})

    method algunaCosaPesa(unPeso) = carga.any({c=>c.peso()==unPeso})
    
    method primerCosaConPeligrosidad(nivelDePeligro) =
        carga.find({c => c.peligrosidad()==nivelDePeligro})
    
    method todasLasCosasConMasPeligrosidad(detPeligrosidad) =
        carga.filter({c=>c.peligrosidad()>detPeligrosidad}) 
    
    method cosasSuperanPeligrosidadDe(unaCosa) =
        carga.filter({c=>c.peligrosidad()>unaCosa.peligrosidad()})
    
    method exedePesoMaximo() =
        self.pesoTotal() > 2500

    method puedeCircular(nivelMax) =
        // Esta es una forma de hacerla 
        !self.exedePesoMaximo() && 
        self.todasLasCosasConMasPeligrosidad(nivelMax).isEmpty()

    // EL METODO BETWEEN USA LA INTERSECCION
    method algunaCosaPesaEntre(valorMin, valorMax) =
        carga.any({c=>c.peso().between(valorMin, valorMax)})
    
    method laCosaMasPesada() = 
        carga.max({c=>c.peso()}) 
}