/*
1) La mejor opción para manejar el peso en las comidas era la siguiente:
. método abstracto peso en Plato
. const property peso en Provoleta
. en esAbundante() usar self.peso()
* 
2) Para esté modelo lo más adecuado era que los panes sean objetos con nombre propio en lugar de clases. "Los tres únicos panes..." la clave en el enunciado esta en la palabra únicos.
 */
class Plato {
	method peso()
	
	method esVegetariano()
	
	method esAbundante(){
		return self.peso() > 250
	}
	
	method valoracion()
	
}

class Provoleta inherits Plato{
	const property tieneEspecias
	const property peso
	override method esVegetariano()=  not tieneEspecias
	
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
	
	override method esVegetariano()= false
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
	
	override method esVegetariano()=  true
	
	override method valoracion(){
		return super() + 17.min(legumbre.size()* 2)
		
	}
}

class Parrillada inherits Plato{
	const cortesPedidos = []
	
	method pedirCorte(corte){
		cortesPedidos.add(corte)
	}
	
	override method esVegetariano()=  false
	
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
