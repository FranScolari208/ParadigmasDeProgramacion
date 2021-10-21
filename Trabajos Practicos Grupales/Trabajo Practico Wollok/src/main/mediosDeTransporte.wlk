// costo por kilometro?? metodo a parte del precioDeTransporte? 
//o el costoPorKilometro es el precioPorKilometro?
class Transporte{
	var tiempoDeViaje
	var precioPorKilometro
	
	method precioDeTransporte(unosKilometros)
}

class Avion inherits Transporte{
	var impulsoTurbinas
	
	override method precioDeTransporte(unosKilometros){
		return unosKilometros * (impulsoTurbinas.sum())
	}
}

class Micro inherits Transporte{
	override method precioDeTransporte(unosKilometros){
		return 5000
	}
}

class Tren inherits Transporte{
	override method precioDeTransporte(unosKilometros){
		return 2300 * (unosKilometros/1.6)
	}
}

class Barco inherits Transporte{
	var probabilidadDeChocar
	
	override method precioDeTransporte(unosKilometros){
		return unosKilometros * (1000 * probabilidadDeChocar)
	}
}

const avion = new Transporte(tiempoDeViaje = 60, precioPorKilometro = 100)
const tren = new Transporte(tiempoDeViaje = 120, precioPorKilometro = 50)