import destinos.*

object barrileteCosmico {

	var destinos = [lastToninas, garlicsSea, goodAirs, silversSea]
	var property usuarios = { pHari }

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

}
