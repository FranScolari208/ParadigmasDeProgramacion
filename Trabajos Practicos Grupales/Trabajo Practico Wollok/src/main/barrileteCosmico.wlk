import localidades.*
import mediosDeTransporte.*
import viajes.*

object barrileteCosmico {
	var destinos = [lastToninas, garlicsSea, goodAirs, silversSea]
	var mediosDeTransporte = [avion, tren]

	method destinos() = destinos

	method obtenerDestinosMasImportantes() {
		return destinos.filter({ unDestino => unDestino.esDestacado() })
	}

	method aplicarDescuentoALosDestinos(unDescuento) {
		destinos.forEach({ unDestino => unDestino.aplicarDescuento(unDescuento)})
	}

	method esEmpresaExtrema() {
		return destinos.any({ unDestino => unDestino.esPeligroso() })
	}

	method cartaDeDestinos() {
		return destinos.map({ unDestino => unDestino.nombre() })
	}
	
	method armarViaje(unUsuario, unDestino){
		var origenUsuario = unUsuario.localidadDeOrigen()
		var transporte = mediosDeTransporte.anyOne()
		const unViaje = new Viaje(origen = origenUsuario, destino = unDestino, medioDeTransporte = transporte)
		return unViaje	
	}

}
