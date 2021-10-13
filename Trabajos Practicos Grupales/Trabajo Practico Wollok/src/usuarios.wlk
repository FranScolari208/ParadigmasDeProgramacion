import destinos.*
import barrileteCosmico.*

class Usuario {

	const nombre
	var viajes
	var dinero
	var usuariosQueSigue = #{}
	var localidadDeOrigen

	method dinero() = dinero
	
	method viajes() = viajes
	
	method localidadDeOrigen() = localidadDeOrigen
	
	method usuariosQueSigue() = usuariosQueSigue

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

	method comprarPasaje(unPrecio) {
		dinero -= unPrecio
	}

	method hacerViaje(unViaje){
		viajes.add(unViaje)
		localidadDeOrigen = unViaje.destino()
	}

	method puedeViajar(unViaje) {
		return unViaje.precioDeViaje() <= dinero
	}
	
	method viajarA(unDestino){
		
		var unViaje = barrileteCosmico.armarViaje(self, unDestino)
		
		if (self.puedeViajar(unViaje)) {
			self.comprarPasaje(unViaje.precioDeViaje())
			self.hacerViaje(unViaje)
		}
	}
}

const pHari = new Usuario(nombre = "Pablo Hari", viajes = [], dinero = 12500, usuariosQueSigue = #{}, localidadDeOrigen = goodAirs)

