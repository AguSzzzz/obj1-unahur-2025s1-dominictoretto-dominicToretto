object dominic {

  const autos =[]

  method llenarListaDeAutosYDejarlosFueraDeCondiciones() // este bloque lo hice para probar, anduve usando la terminal en vez de hacer tests
   {
    self.comprarUnAuto(ferrari)
    self.comprarUnAuto(flechaRubi)
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
    self.hacerPruebasDeVelocidad()
  }
  method autos() = autos
  method comprarUnAuto(unAuto) = autos.add(unAuto)
  method venderUnAuto(unAuto) = autos.remove(unAuto)
  method autosEnCondiciones() = autos.filter({a=> a.estaEnCondiciones()})
  method autosNoEnCondiciones() = autos.filter({a=> !a.estaEnCondiciones()})
  method hacerPruebasDeVelocidad() = autos.forEach({a=> a.pruebaDeVelocidad()})
  method finalDeTemporada() = autos.forEach({a=> self.venderUnAuto(a)}) // o autos.clear() bruh
  method promedioDeVelocidades() = (autos.sum({a=> a.velocidadMaxima()} ) / autos.size())
  method autoMasRapido() = autos.max({a=> a.velocidadMaxima()})
  method hayUnAutoMuyRapido() = (self.autoMasRapido().velocidadMaxima()) > (self.promedioDeVelocidades() * 2)

  method mandarAutosAlTallerYLimpiarLista(){
    self.mandarAutosAlTaller()
    self.limpiarConjunto()
  }

  method limpiarConjunto() = autos.clear()
  method mandarAutosAlTaller() = self.autosNoEnCondiciones().forEach({a=> taller.recibirUnAuto(a)})
  method aniadirUnAuto(unAuto) = autos.add(unAuto)
  // method mandarAlTaller(){taller.recibirAutos(self.autosNoEnCondiciones())} solucion del profe.
  // aniadi el limpiar conjunto xq si no al recibir los autos de vuelta en el taller terminas con duplicados
}

object taller {
  const autosAReparar =[]

method autosAReparar() = autosAReparar
method recibirUnAuto(unAuto) = autosAReparar.add(unAuto)
method repararYDevolverTodosLosAutos(){
  self.repararTodosLosAutos()
  autosAReparar.forEach({a=> dominic.aniadirUnAuto(a)})
  autosAReparar.clear()
}
method repararTodosLosAutos() = autosAReparar.forEach({a=> a.reparar()})
/*
method recibirAutos(unaListaDeAutos){
  autosAReparar.addAll(autosAReparar)
} Solucion del profe.`
*/
}

// autos

object ferrari {

  var potencia = 87


  method potencia() = potencia
  method estaEnCondiciones() = potencia > 65

  method reparar(){
    potencia = 100
  }

 
  method velocidadMaxima() {
    if (potencia > 75) {
      return 125
      }
    else {
      return 110
    }
  }
  

  method pruebaDeVelocidad(){
    potencia = (potencia - 30).max(0)
  }

}

object flechaRubi {

  var cantidadDeCombustible = 100
  var tipoDeCombustible = gasolina
  var color = azul


  method cantidadDeCombustible() = cantidadDeCombustible
  method cantidadDeCombustible(cantidad) {cantidadDeCombustible = cantidad}
  method tipoDeCombustible() = tipoDeCombustible
  method tipoDeCombustible(unTipoDeCombustible){tipoDeCombustible = unTipoDeCombustible}
  method cambiarColor(){color = color.cambiarColor()}

  method estaEnCondiciones(){
    return cantidadDeCombustible < tipoDeCombustible.cantidadNecesaria() && 
      color == rojo 
      // No encuentro la manera de q lea el valor de la variable color, asi q
      // nunca va a estar en condiciones porque nunca va a entender el mensaje rojo
  }


  method velocidadMaxima(){ 
    return(cantidadDeCombustible * 2 + tipoDeCombustible.velocidadAniadida(cantidadDeCombustible))
  }

  method pruebaDeVelocidad() {
    //if(self.estaEnCondiciones()){ No uso esta linea xq no funciona ya siempre da false, ya que no pude hacer que reconozca el color.
    cantidadDeCombustible = (cantidadDeCombustible-5).max(1) 
    // pongo .max(1) en lugar de .max(0) xq si no el auto se vuelve irreparable, ya q 0*2 = 0 
  }

  method reparar(){
    cantidadDeCombustible = cantidadDeCombustible * 2
    self.cambiarColor()
  }
}

object intocable {

  var estaEnCondiciones = true

  method estaEnCondiciones() = estaEnCondiciones
  method velocidadMaxima() = 45
  method reparar() { estaEnCondiciones = true }
  method pruebaDeVelocidad() {estaEnCondiciones = false}

}

object gasolina{
  method cantidadNecesaria() = 85
  method velocidadAniadida(litros) = litros + 10
}

object nafta{
  method cantidadNecesaria() = 50
  method velocidadAniadida(litros) = litros * 0.1
}

object nitrogeno {
  method cantidadNecesaria() = 0
  method velocidadAniadida(litros) = litros * 10
}


object rojo {
  method cambiarColor() = azul
}

object azul {
  method cambiarColor() = verde
}

object verde {
  method cambiarColor() = rojo
}

/*
object colores{
  method cambiarDeColor(unColor){
    if (unColor = "rojo") {
      return "azul"
    }
    else if (unColor = "azul") {
      return "verde"
    }
    else {
      return "rojo"
    }
  }
} intente probar esto pero da, Malformed Sentence, no funca, no se. deberia de probarlo haciendolo un metodo dentro del objeto flechaRubi!
*/
