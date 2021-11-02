import localidades.*
import barrileteCosmico.*
import viajes.*
import tiposDeUsuarios.*
import tiposDeLocalidades.*

class Usuario{
	const nombre
	var localidadDeOrigen
	var viajes
	var dinero
	var usuariosQueSigue
	var tipoDeUsuario
	
	method nombre() = nombre

	method dinero() = dinero
	
	method tipoDeUsuario() = tipoDeUsuario
		
	method localidadDeOrigen() = localidadDeOrigen

	method viajes() = viajes
	
	method usuariosQueSigue() = usuariosQueSigue

	method viajarA(unDestino) {
		const unViaje = barrileteCosmico.armarViaje(self, unDestino)
		if (self.puedeViajar(unViaje)) {
			self.comprarPasaje(unViaje)
			self.hacerViaje(unViaje)
			self.setLocalidadDeOrigen(unViaje.destino())
			return "buen viaje"
		} else {
			return "anda a laburar"
		}
	}

	method kilometros() {
		return viajes.sum({ unViaje => unViaje.distanciaRecorrida() })
	}

	method seguirUsuario(unUsuario) {
		usuariosQueSigue.add(unUsuario)
		unUsuario.devolverFollow(self)
	}

	method devolverFollow(unUsuario) {
		usuariosQueSigue.add(unUsuario)
	}

	method comprarPasaje(unViaje) {
		dinero -= unViaje.precioDeViaje()
	}

	method hacerViaje(unViaje) {
		viajes.add(unViaje)
	}
	
	method setLocalidadDeOrigen(unaLocalidad){
		localidadDeOrigen = unaLocalidad
	}

	method puedeViajar(unViaje) {
		return unViaje.precioDeViaje() <= dinero
	}
	
	method elegirTransporte(unosKilometros){
		return tipoDeUsuario.elegirTransportePorTipo(self, unosKilometros)
	}
	
	method cambiarTipoDeUsuario(unTipo){
		tipoDeUsuario = unTipo
	}
}

const pHari = new Usuario(nombre = "Pablo Hari", localidadDeOrigen = goodAirs, viajes = [], dinero = 802500, usuariosQueSigue = [], tipoDeUsuario = familiar)
const franco = new Usuario(nombre = "Franco", localidadDeOrigen = buenosAires, viajes=[], dinero = 300000, usuariosQueSigue = [], tipoDeUsuario = estudiantil)
const santiago = new Usuario(nombre = "Santiago", localidadDeOrigen = garlicsSea, viajes=[], dinero = 3000000, usuariosQueSigue = [], tipoDeUsuario = empresarial)
