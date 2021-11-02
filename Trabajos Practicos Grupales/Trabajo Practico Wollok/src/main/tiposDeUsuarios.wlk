import barrileteCosmico.*
import usuarios.*
import tiposDeLocalidades.*
import localidades.*

object empresarial{
	
	method elegirTransportePorTipo(unUsuario, unosKilometros){
		return barrileteCosmico.elegirTransporteEmpresarial()
	}
}

object estudiantil{
	
	method elegirTransportePorTipo(unUsuario, unosKilometros){
		return barrileteCosmico.elegirTransporteEstudiantil(unUsuario, unosKilometros)
	}
}

object familiar{
	
	method elegirTransportePorTipo(unUsuario, unosKilometros){
		return barrileteCosmico.elegirTransporteFamiliar()
	}
}
