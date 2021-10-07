class Localidad{
	var nombre
	var equipajeImprescindible
	var precio
	var kilometro
	
	method nombre(){
		return nombre
	}

	method precio(){
		return precio
	}

	method equipajeImprescindible(){
		return equipajeImprescindible
	}

	method esDestacado() {
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
		return equipajeImprescindible.any({ unEquipaje => unEquipaje.contains("Vacuna") })
	}
	
	method kilometro(){
		return kilometro
	}
	
	method calcularDistancia(otraLocalidad){
		const distancia = otraLocalidad.kilometro() - self.kilometro()
		return distancia.abs()
	}
}
