import localidades.*
class TipoDeLocalidad{
	var nombre
	
	method esPeligroso(unaLocalidad)
	method esDestacado(unaLocalidad)
}

class Playa inherits TipoDeLocalidad{
	
	override method esPeligroso(unaLocalidad){
		return false
	}
	
	override method esDestacado(unaLocalidad){
		//tiene que retornar algo??
	}
}

class Montania inherits TipoDeLocalidad{
	var altura
	
	override method esPeligroso(unaLocalidad){
		return unaLocalidad.esMontaniaPeligrosa() && altura >= 5000
	}
	
	override method esDestacado(unaLocalidad){
		return true
	}
}

class CiudadHistorica inherits TipoDeLocalidad{
	var cantidadMuseos
	
	override method esPeligroso(unaLocalidad){
		return unaLocalidad.esCiudadPeligrosa()
	}
	
	override method esDestacado(unaLocalidad){
		return unaLocalidad.esLocalidadDestacada() && cantidadMuseos >=3
	}
}

const playaSoleada = new Playa(nombre="Playa Soleada")
const aconcagua = new Montania(nombre= "Aconcagua", altura=6000)
const everest = new Montania(nombre="Everest", altura=3000)
const buenosAires = new CiudadHistorica(nombre="Buenos Aires", cantidadMuseos=4)