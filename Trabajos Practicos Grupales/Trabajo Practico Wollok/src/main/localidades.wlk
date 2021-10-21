import tipoDeLocalidades.*

class Localidad {

	var nombre
	var equipajeImprescindible
	var precio
	var kilometroDeUbicacion
	var tipoDeLocalidad

	method nombre() = nombre

	method precio() = precio

	method equipajeImprescindible() = equipajeImprescindible
	
	method kilometroDeUbicacion() = kilometroDeUbicacion

	method esDestacado() {
		return tipoDeLocalidad.esDestacado(self)		
	}
	
	method esLocalidadDestacada(){
		return precio > 2000
	}

	method aplicarDescuento(unDescuento) {
		self.reducirPrecio(unDescuento)
		self.agregarEquipaje("Certificado de descuento")
	}

	method reducirPrecio(descuento) {
		precio -= precio * descuento / 100
	}

	method agregarEquipaje(equipaje) {
		equipajeImprescindible.add(equipaje)
	}

	method esPeligroso() {
		return tipoDeLocalidad.esPeligroso(self)
	}
	
	method esMontaniaPeligrosa(){
		return equipajeImprescindible.any({ unEquipaje => unEquipaje.contains("Vacuna") })
	}
	
	method esCiudadPeligrosa(){
		return !equipajeImprescindible.any({ unEquipaje => unEquipaje.contains("Seguro de viajero") })
	}
	
	method calcularDistancia(otraLocalidad){
		const distancia = otraLocalidad.kilometroDeUbicacion()-self.kilometroDeUbicacion()
		return distancia.abs()
	}

}	

const garlicsSea = new Localidad(nombre = "Garlic's Sea", equipajeImprescindible = ["Caña de Pescar", "Piloto"], precio = 2500, kilometroDeUbicacion = 100, tipoDeLocalidad = aconcagua)

const silversSea = new Localidad(nombre = "Silver's Sea", equipajeImprescindible = ["Protector solar", "Equipo de buceo"], precio = 1350, kilometroDeUbicacion = 350, tipoDeLocalidad = everest)

const lastToninas = new Localidad(nombre = "Last Toninas", equipajeImprescindible = ["Vacuna Gripal", "Vacuna B", "Necronomicon"], precio = 3500, kilometroDeUbicacion = 50, tipoDeLocalidad = playaSoleada)

const goodAirs = new Localidad(nombre = "Good Airs", equipajeImprescindible = ["Cerveza", "Protector Solar", "Seguro de viajero"], precio = 1500, kilometroDeUbicacion = 200, tipoDeLocalidad = buenosAires)



