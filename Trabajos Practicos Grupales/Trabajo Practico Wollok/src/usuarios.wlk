import destinos.*

class Usuario {

	const nombre
	var viajes
	var dinero
	var usuariosQueSigue
	var localidadDeOrigen

	method dinero() = dinero

	method volarAUnDestino(destino) {
		if (self.puedeViajar(destino)) {
			self.comprarPasaje(destino)
			self.viajarADestino(destino)
			return "buen viaje"
		} else {
			return "anda a laburar"
		}
	}

	method kilometros(){
		const kilometrosViajes = viajes.map({ unViaje => unViaje.distanciaRecorrida() })
		return kilometrosViajes.sum()
	}

	method seguirUsuario(unUsuario) {
		usuariosQueSigue.add(unUsuario)
		unUsuario.devolverFollow(self)
	}

	method devolverFollow(unUsuario) {
		usuariosQueSigue.add(unUsuario)
	}

	method comprarPasaje(destino) {
		dinero -= destino.precio()
	}

	method viajarADestino(destino) {
		destinosQueVisito.add(destino)
	}

	method puedeViajar(destino) {
		return destino.precio() <= dinero
	}
	
	method viajar(unViaje){
		if (self.puedeViajar(unViaje.destino())) {
			self.comprarPasaje(unViaje.destino())
			self.viajarADestino(unViaje.destino())
			return "buen viaje"
		} else {
			return "anda a laburar"
		}
	}

}

const pHari = new Usuario(nombre = "Pablo Hari", destinosQueVisito = [ lastToninas, goodAirs ], dinero = 1500, usuariosQueSigue = [])




// correcciones para hacer por prueba 2
// ver el tema de que kilometro ponerle a los destinos descriptos
// ver que localidad ponerle a phari
// ver q viajes poner a phari
// ver como hacer el tema de los viajes
// ver que metodos modificar y borrar
// ver los tests
// ver si hay que declarar transportes
// ver si hay que instanciar viajes
// ver metodo viajar
