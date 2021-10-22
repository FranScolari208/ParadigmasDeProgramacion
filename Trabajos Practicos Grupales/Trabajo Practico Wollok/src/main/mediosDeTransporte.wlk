// costo por kilometro?? metodo a parte del precioDeTransporte? 
//o el costoPorKilometro es el precioPorKilometro?
class Transporte{
	var tiempoDeViaje
	var precioPorKilometro
	
	method precioDeTransporte(unosKilometros){
		var costo = self.costoPorKilometro()
		return costo * unosKilometros
	}
	
	method costoPorKilometro()
	method tiempoDeViaje()= tiempoDeViaje
}

class Avion inherits Transporte{
	var impulsoTurbinas
	
	override method costoPorKilometro(){
		return impulsoTurbinas.sum()
	}
}

class Micro inherits Transporte{
	override method costoPorKilometro(){
		return 5000
	}
}

class Tren inherits Transporte{
	override method costoPorKilometro(){
		return 2300*0.6 
	}	// hacer kilometros*0,6 * 2300 es lo mismo que kilometros * 2300*0,6
	
}

class Barco inherits Transporte{
	var probabilidadDeChocar
	
	override method costoPorKilometro(){
		return 1000 * probabilidadDeChocar
	}
}

const avion500 = new Avion(tiempoDeViaje = 60, precioPorKilometro = 100, impulsoTurbinas = [20, 40, 60])
const trenRoca = new Tren(tiempoDeViaje = 120, precioPorKilometro = 50)
const plusmar = new Micro(tiempoDeViaje = 170, precioPorKilometro = 70)
const titanic = new Barco(tiempoDeViaje = 300, precioPorKilometro = 10, probabilidadDeChocar = 8)