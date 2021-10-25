class Transporte{
	var tiempoDeViaje
	
	method tiempoDeViaje() = tiempoDeViaje
	
	method precioDeTransporte(unosKilometros){
		return self.costoPorKilometro() * unosKilometros
	}
	
	method costoPorKilometro()
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
	}
}

class Barco inherits Transporte{
	var probabilidadDeChocar
	
	override method costoPorKilometro(){
		return 1000 * probabilidadDeChocar
	}
}

const avion = new Avion(tiempoDeViaje = 60, impulsoTurbinas = [2000, 2000, 2000, 2000])
const tren = new Tren(tiempoDeViaje = 120)
const micro = new Micro(tiempoDeViaje = 150)
const barco = new Barco(tiempoDeViaje = 300, probabilidadDeChocar = 1)
