import mediosDeTransporte.*
import destinos.*
class Viaje{
	var origen
	var destino
	var medioDeTransporte
	
	method origen(){
		return origen
	}
	
	method destino(){
		return destino
	}
	
	method distanciaRecorrida(){
		return origen.calcularDistancia(destino)
	}
	
	method precioDeViaje(){
		const kilometros = self.distanciaRecorrida()
		return destino.precio() + medioDeTransporte.precioDeTransporte(kilometros)
	}
	
}

const viajeAGarlicSea = new Viaje(origen = goodAirs, destino = garlicsSea, medioDeTransporte = avion)