class Plato {
	var property peso = 0
	
	method esVegetariano()
	
	method esAbundante(){
		return peso > 250
	}
	
	method valoracion()
	
}

class Provoleta inherits Plato{
	const property tieneEspecias
	
	override method esVegetariano()= return not tieneEspecias
	
	method esEspecial(){
		return self.esAbundante() or tieneEspecias
	}
	
	override method valoracion(){
		if (self.esEspecial()){
			return 120
		}else{
			return 80
		}
	}
}

class HamburguesaDeCarne inherits Plato{
	const property pan
	
	override method peso(){
		return 250
	}
	
	override method valoracion(){
		return 60 + pan.valoracion()
	}
	
	override method esVegetariano()= return false
}
//------------------Panes-------------------//
class Pan{
	method valoracion()
}

class PanIndustrial inherits Pan{
	override method valoracion(){
		return 0
	}
}

class PanCasero inherits Pan{
	override method valoracion(){
		return 20
	}
}

class PanDeMasaMadre inherits Pan{
	override method valoracion(){
		return 45
	}
}

//----------------------------------//

class HamburguesaVegetariana inherits HamburguesaDeCarne{
	
	const property legumbre //string
	
	override method esVegetariano()= return true
	
	override method valoracion(){
		return super() + 17.min(legumbre.size()* 2)
		
	}
}

class Parrillada inherits Plato{
	const cortesPedidos = []
	
	method pedirCorte(corte){
		cortesPedidos.add(corte)
	}
	
	override method esVegetariano()= return false
	
	override method peso(){
		return cortesPedidos.sum({c => c.peso()})
	}
	
	method corteConMayorCalidad(){
		return cortesPedidos.max({c => c.calidad()})
	}
	
	override method valoracion(){
		return 15 * self.corteConMayorCalidad().calidad() - cortesPedidos.size()
	}
}

class CorteDeCarne{
	const nombre //string
	const property peso
	const property calidad
}
