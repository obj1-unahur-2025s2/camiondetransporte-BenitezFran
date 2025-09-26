// ================= OBJETOS =================
// ======== Knight Rider ========
object knightRider {

  method peso() = 500
  method peligrosidad() = 10
  method esPesoPar() = self.peso().even()
  method bultos() = 1
  method consecuenciaDeCarga(){}
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
  method bultos() = 2
  method consecuenciaDeCarga(){
    self.transformRobot()
  }
}

// ======== Ladrillos ========
object ladrillos {
  var cant = 10

  method cantidad(nuevaCantidad) {
    cant = nuevaCantidad.max(0)// el maximo entre nueva cantidad y 0
  }
  method peso() = cant * 2
  method peligrosidad() = 2
  method esPesoPar() = self.peso().even()
  
  method bultos(){
    return 
        if(cant <= 100){1}
        else if(cant.between(101, 300)){2}
        else {3}
  } 
  method consecuenciaDeCarga(){
    cant += 12
  }
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
  method bultos() = 1
  method consecuenciaDeCarga(){
    peso = (peso - 10).max(0)
  }
}

// ======== Batería antiaérea ========
object bateriAantiaerea {

var tieneMisiles = false

  method cargarMisiles(){ tieneMisiles = true}

  method peso() = if(tieneMisiles) 300 else 200

  method peligrosidad() = if(tieneMisiles) 100 else 0
  method esPesoPar() = self.peso().even()
  method bultos() = if(tieneMisiles) 2 else 1
  method consecuenciaDeCarga(){
    self.cargarMisiles()
  }
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
  method bultos() = 1 + cosasDentro.sum({c=>c.bultos()})
  method consecuenciaDeCarga(){
    if(not cosasDentro.isEmpty())
        cosasDentro.forEach({c=>c.consecuenciaDeCarga()})
  }
}
// ======== Residuos radioactivos ========
object residuosRadioactivos {

var property peso = 0

   method peligrosidad()= 200
   method esPesoPar() = self.peso().even()
   method bultos() = 1
   method consecuenciaDeCarga() {
     peso += 15
   }
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
  method bultos() = 2
  method consecuenciaDeCarga() {}
}

// puede contemplarse un objeto nada, para el embalaje, pero es innecesario
object nada {
  method peso() = 0
  method peligrosidad() = 0
  method esPesoPar() = self.peso().even()
}