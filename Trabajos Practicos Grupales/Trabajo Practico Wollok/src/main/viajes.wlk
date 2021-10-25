import mediosDeTransporte.*
import localidades.*

class Viaje{
	var origen
	var destino
	var medioDeTransporte
	
	method destino() = destino
	
	method origen() = origen
	
	method medioDeTransporte() = medioDeTransporte
	
	method distanciaRecorrida(){
		return origen.calcularDistancia(destino)
	}
	
	method precioDeViaje(){
		const kilometros = self.distanciaRecorrida()
		return destino.precio() + medioDeTransporte.precioDeTransporte(kilometros)
	}
}

const viajeAGarlic = new Viaje(origen=goodAirs, destino = garlicsSea, medioDeTransporte = avion)