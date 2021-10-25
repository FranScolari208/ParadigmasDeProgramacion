import barrileteCosmico.*
import usuarios.*
import tiposDeLocalidades.*
import localidades.*

class Empresarial inherits Usuario{
	
	method elegirTransporte(unosKilometros){
		return barrileteCosmico.elegirTransporteEmpresarial()
	}
}

class Estudiantil inherits Usuario{
	
	method elegirTransporte(unosKilometros){
		return barrileteCosmico.elegirTransporteEstudiantil(self, unosKilometros)
	}
}

class Familiar inherits Usuario{
	
	method elegirTransporte(unosKilometros){
		return barrileteCosmico.elegirTransporteFamiliar()
	}
}

const franco = new Estudiantil(nombre = "Franco", localidadDeOrigen = buenosAires, viajes=[], dinero = 300000, usuariosQueSigue = [])
const santiago = new Empresarial(nombre = "Santiago", localidadDeOrigen = garlicsSea, viajes=[], dinero = 3000000, usuariosQueSigue = [])