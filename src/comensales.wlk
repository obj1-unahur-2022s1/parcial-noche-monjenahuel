/*
 Recordá que podes usar el mensaje ```numero.even()``` a un número para saber si es par.
 */
import comidas.*

class Comensales {
	const property peso
	const property comidasQueComio = []
	
	method comer(comida){
		comidasQueComio.add(comida)
	}
	
	method leAgrada(comida)
	
	method pesoDeLasComidasIngeridas(){
		return comidasQueComio.sum({c => c.peso()})
	}
	
	method estaSatisfecho(){
		return self.pesoDeLasComidasIngeridas() >= self.peso() * 0.01
	} 
	
}

class Vegetariano inherits Comensales{
	override method leAgrada(comida){
		return comida.esVegetariano() and comida.valoracion() > 85
	}
	
	override method estaSatisfecho(){
		return super() and not (comidasQueComio.any({c => c.esAbundante()}))
	} 
	
}

class HambrePopular inherits Comensales{
	override method leAgrada(comida){
		return comida.esAbundante()
	}
}

class PaladarFino inherits Comensales{
	override method leAgrada(comida){
		return comida.peso().between(150,300) and comida.valoracion() > 100
	}
	
	override method estaSatisfecho(){
		return super() and comidasQueComio.size() % 2 == 0
	}
}