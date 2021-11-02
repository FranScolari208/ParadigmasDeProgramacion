import localidades.*

class Playa inherits Localidad{
	
	override method esPeligroso(){
		return false
	}
}

class Montania inherits Localidad{
	var altura
	
	override method esPeligroso(){
		return super() && altura >= 5000
	}
	
	override method esDestacado(){
		return true
	}
}

class CiudadHistorica inherits Localidad{
	const cantidadMuseos
	
	override method esPeligroso(){
		return !equipajeImprescindible.contains("Seguro de Asistencia")
	}
	
	override method esDestacado(){
		return super() && cantidadMuseos >=3
	}
}

const buenosAires = new CiudadHistorica(nombre = "Buenos Aires", equipajeImprescindible = ["Vacuna", "Seguro de Asistencia"], precio = 4000, kilometroDeUbicacion = 450, cantidadMuseos = 4)
const cordobaCapital = new CiudadHistorica(nombre = "Cordoba Capital", equipajeImprescindible = ["Vacuna"], precio = 4000, kilometroDeUbicacion = 350, cantidadMuseos = 1)
const cancun = new Playa(nombre = "Cancun", equipajeImprescindible = [], precio = 200, kilometroDeUbicacion = 500)
const miami = new Playa(nombre = "Miami", equipajeImprescindible = [], precio = 3000, kilometroDeUbicacion = 400)
const everest = new Montania(nombre = "Everest", equipajeImprescindible =["Vacuna", "Botas"], precio = 3000, kilometroDeUbicacion = 600, altura = 6000)
const aconcagua = new Montania(nombre = "Aconcagua", equipajeImprescindible =["Vacuna", "Botas"], precio = 3000, kilometroDeUbicacion = 400, altura = 2000)