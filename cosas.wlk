object cosas {
    
}

// ================= OBJETOS =================
// ======== Knight Rider ========
object knightRider {

  method peso() = 500
  method peligrosidad() = 10
  method esPesoPar() = self.peso().even()
}

// ======== Bumblebee ========
object bumblebee {

var esAuto = true

  method transformAuto() {
    esAuto = true
  }
  method transformRobot() {
    esAuto = false
  }

  method peso() = 800
  // EXPRESION TERNARIA
  method peligrosidad() = if(esAuto) 15 else 30
  method esPesoPar() = self.peso().even()
}

// ======== Ladrillos ========
object ladrillos {
  var cant = 10

  method cantidad(nuevaCantidad) {
    cant = nuevaCantidad
  }
  method peso() = cant * 2
  method peligrosidad() = 2
  method esPesoPar() = self.peso().even()
}

// ======== Arena a Granel ========
object arena {

//En este caso , es apropiado de usar el property

var property peso = 0
/*
  method peso(nuevoPeso) {
    peso = nuevoPeso
  }
  method peso() = peso
*/
  method peligrosidad() = 1
  method esPesoPar() = self.peso().even()
}

// ======== Batería antiaérea ========
object bateriAantiaerea {

var tieneMisiles = false

  method cargarMisiles(){ tieneMisiles = true}

  method peso() = if(tieneMisiles) 300 else 200

  method peligrosidad() = if(tieneMisiles) 100 else 0
  method esPesoPar() = self.peso().even()
}
// ======== Contenedor ========
object contendedor {
const cosasDentro = []

  method agregar(unaCosa) {
        cosasDentro.add(unaCosa)
        }
  method agregarVarias(variasCosas) {
        cosasDentro.addAll(variasCosas)
        }
  method quitar(unaCosa) {
        cosasDentro.remove(unaCosa)
        }
    
  method peso() = 100 + cosasDentro.sum({c=>c.peso()})
  
  method peligrosidad(){
         return 
            if(cosasDentro.isEmpty()) 0 else cosasDentro.max({c => c.peligrosidad()}).peligrosidad()
        }
  method esPesoPar() = self.peso().even()
}
// ======== Residuos radioactivos ========
object residuosRadioactivos {

var property peso = 0

   method peligrosidad()= 200
   method esPesoPar() = self.peso().even()
}
// ======== Embalaje de seguridad ========
object embalajeDeSeguridad {

// Podria hacer un embalaje que no envuelva nada jaja
  var cosaEnvuelta = arena

  method envolver(unaCosa){
    cosaEnvuelta = unaCosa
  } 

  method peso() = cosaEnvuelta.peso()
  method peligrosidad() = cosaEnvuelta.peligrosidad() / 2
  method esPesoPar() = self.peso().even()
}

// puede contemplarse un objeto nada, para el embalaje, pero es innecesario
object nada {
  method peso() = 0
  method peligrosidad() = 0
  method esPesoPar() = self.peso().even()
}