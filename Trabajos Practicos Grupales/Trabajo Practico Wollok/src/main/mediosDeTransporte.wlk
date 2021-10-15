class Transporte{
	var tiempoDeViaje
	var precioPorKilometro
	
	method precioDeTransporte(unosKilometros){
		return precioPorKilometro * unosKilometros
	}
}

const avion = new Transporte(tiempoDeViaje = 60, precioPorKilometro = 100)
const tren = new Transporte(tiempoDeViaje = 120, precioPorKilometro = 50)