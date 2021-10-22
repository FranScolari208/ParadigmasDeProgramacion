import localidades.*
import mediosDeTransporte.*
import viajes.*

object barrileteCosmico {
	var destinos = [lastToninas, garlicsSea, goodAirs, silversSea]
	var mediosDeTransporte = [avion500, trenRoca, titanic, plusmar]

	method destinos() = destinos
	
	method mediosDeTransporte() = mediosDeTransporte

	method obtenerDestinosMasImportantes() {
		return destinos.filter({ unDestino => unDestino.esDestacado()})
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
		var transporte = unUsuario.seleccionarTransporte()
		const unViaje = new Viaje(origen = origenUsuario, destino = unDestino, medioDeTransporte = transporte)
		return unViaje	
	}
	
	method elegirTransporteFamiliar(){
		return mediosDeTransporte.anyOne()
	}
	
	method elegirTransporteEstudiantil(unUsuario){
		var transportesPosibles = self.transportesPosiblesDeCostear(unUsuario)
		return self.transporteMasRapido(transportesPosibles)
	}
	
	method elegirTransporteEmpresarial(){
		return self.transporteMasRapido(mediosDeTransporte)
	}
		
	method transportesPosiblesDeCostear(unUsuario){
		return mediosDeTransporte.filter({unTransporte=>unTransporte.costoPorKilometro() <= unUsuario.dinero()})
	}
	
	method transporteMasRapido(unosTransportes){
		return unosTransportes.min({unTransporte=>unTransporte.tiempoDeViaje()})
	}

}
