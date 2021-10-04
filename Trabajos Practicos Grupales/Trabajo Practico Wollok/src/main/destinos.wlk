class Destino {

	var nombre
	var equipajeImprescindible
	var precio

	method nombre() = nombre

	method precio() = precio

	method equipajeImprescindible() = equipajeImprescindible

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

}	

const garlicsSea = new Destino(nombre = "Garlic's Sea", equipajeImprescindible = [ "Caña de Pescar", "Piloto" ], precio = 2500)

const silversSea = new Destino(nombre = "Silver's Sea", equipajeImprescindible = [ "Protector solar", "Equipo de buceo" ], precio = 1350)

const lastToninas = new Destino(nombre = "Last Toninas", equipajeImprescindible = [ "Vacuna Gripal", "Vacuna B", "Necronomicon" ], precio = 3500)

const goodAirs = new Destino(nombre = "Good Airs", equipajeImprescindible = [ "Cerveza", "Protector Solar" ], precio = 1500)



