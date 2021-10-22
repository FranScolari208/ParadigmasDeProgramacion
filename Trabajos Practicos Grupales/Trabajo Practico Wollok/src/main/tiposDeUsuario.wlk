//como elegir los transportes???
//el del minimo precio
import barrileteCosmico.*
object empresarial{
	
	method elegirTransporte(unUsuario){
		return barrileteCosmico.elegirTransporteEmpresarial()
	}
}

object estudiantil{
	
	method elegirTransporte(unUsuario){
		return barrileteCosmico.elegirTransporteEstudiantil(unUsuario)
		//return unosTransportes.min({unTransporte=>unTransporte.precioPorKilometro()})
	}
}

object familiar{
	
	method elegirTransporte(unUsuario){
		return barrileteCosmico.elegirTransporteFamiliar()
	}
}