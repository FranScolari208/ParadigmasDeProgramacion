import localidades.*
import barrileteCosmico.*
import viajes.*
import tiposDeUsuario.*

class Usuario{
	var nombre
	var localidadDeOrigen
	var viajes
	var dinero
	var tipoDeUsuario
	var usuariosQueSigue

	method dinero() = dinero
	
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
	
	method seleccionarTransporte(){
		return tipoDeUsuario.elegirTransporte(self)
	}

	method kilometros() {
		return viajes.sum({ unViaje => unViaje.distanciaRecorrida()})
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
}

const pHari = new Usuario(nombre = "Pablo Hari", localidadDeOrigen = goodAirs, viajes = [], dinero = 14500, tipoDeUsuario = familiar, usuariosQueSigue = [])

