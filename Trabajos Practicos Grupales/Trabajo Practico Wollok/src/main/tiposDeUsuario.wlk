//como elegir los transportes???
//el del minimo precio
object empresarial{
	
	method elegirTransporte(unosTransportes){
		
	}
}

object estudiantil{
	
	method elegirTransporte(unosTransportes){
		return unosTransportes.min({unTransporte=>unTransporte.precioPorKilometro()})
	}
}

object famliar{
	
	method elegirTransporte(unosTransportes){
		return unosTransportes.anyOne()
	}
}