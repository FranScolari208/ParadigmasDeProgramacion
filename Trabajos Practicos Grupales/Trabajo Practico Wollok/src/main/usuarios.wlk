import destinos.*

class Usuario {

	var nombre
	var destinosQueVisito
	var dinero
	var usuariosQueSigue

	method dinero() = dinero

	method destinosQueVisito() = destinosQueVisito

	method volarAUnDestino(destino) {
		if (self.puedeViajar(destino)) {
			self.comprarPasaje(destino)
			self.viajarADestino(destino)
			return "buen viaje"
		} else {
			return "anda a laburar"
		}
	}

	method kilometros() {
		var preciosDestinos = destinosQueVisito.map({ unDestino => unDestino.precio() })
		return preciosDestinos.sum() * 0.1
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

}

const pHari = new Usuario(nombre = "Pablo Hari", destinosQueVisito = [ lastToninas, goodAirs ], dinero = 1500, usuariosQueSigue = [])

