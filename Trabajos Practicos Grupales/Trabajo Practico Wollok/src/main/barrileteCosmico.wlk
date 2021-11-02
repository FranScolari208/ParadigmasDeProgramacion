import localidades.*
import mediosDeTransporte.*
import viajes.*
import tiposDeLocalidades.*

object barrileteCosmico {
	const destinos = [lastToninas, garlicsSea, goodAirs, silversSea, miami, buenosAires, cordobaCapital, cancun, everest, aconcagua]
	const mediosDeTransporte = [avion, tren, micro, barco]

	method destinos() = destinos
	
	method mediosDeTransporte() = mediosDeTransporte

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
		const origenUsuario = unUsuario.localidadDeOrigen()	
		const kilometrosDeViaje = origenUsuario.calcularDistancia(unDestino)
		const transporte = unUsuario.elegirTransporte(kilometrosDeViaje)
		const unViaje = new Viaje(origen = origenUsuario, destino = unDestino, medioDeTransporte = transporte)	
		return unViaje	
	}
	
	method elegirTransporteEmpresarial(){
		return self.transporteMasRapido(mediosDeTransporte)
	}
	
	method transporteMasRapido(unosTransportes){
		return unosTransportes.min({unTransporte=>unTransporte.tiempoDeViaje()})
		// medir transporte mas veloz por una variable velocidad o esta bien el tiempo?
	}
	
	method elegirTransporteEstudiantil(unUsuario, unosKilometros){
		const posiblesDeCostear = mediosDeTransporte.filter({unTransporte => unTransporte.precioDeTransporte(unosKilometros) <= unUsuario.dinero()})
		return self.transporteMasRapido(posiblesDeCostear)
	}
	
	method elegirTransporteFamiliar(){
		return mediosDeTransporte.anyOne()
	}

}
