class Transporte{
	var tiempoDeViaje
	var precioPorKilometro
	
	method precioPorKilometro(){
		return precioPorKilometro
	}
	
	method precioDeTransporte(unosKilometros){
		return self.precioPorKilometro() * unosKilometros
	}
}

const avion = new Transporte(tiempoDeViaje = 60, precioPorKilometro = 100)
const tren = new Transporte(tiempoDeViaje = 240, precioPorKilometro = 50)
