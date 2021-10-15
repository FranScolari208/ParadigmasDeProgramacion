import mediosDeTransporte.*
import localidades.*

class Viaje{
	var origen
	var destino
	var medioDeTransporte
	
	method destino() = destino
	
	method distanciaRecorrida(){
		return origen.calcularDistancia(destino)
	}
	
	method precioDeViaje(){
		var kilometros = self.distanciaRecorrida()
		return destino.precio() + medioDeTransporte.precioDeTransporte(kilometros)
	}
}

const viajeAGarlic = new Viaje(origen=goodAirs, destino = garlicsSea, medioDeTransporte = avion)