import comidas.*
import comensales.*

class Cocina{
	const property comidasPreparadas = []
	
	method prepararComida(comida){
		comidasPreparadas.add(comida)
	}
	
	method entregarComida(comida){
		comidasPreparadas.remove(comida)
	}
	
	method menuCarnivoro(){
		return comidasPreparadas.filter({c => not c.esVegetariano()})
	}
	
	method menuVegetariano(){
		return comidasPreparadas.filter({c => c.esVegetariano()})
	}
	
	method cantComidasVegetarianas(){
		return self.menuVegetariano().size()
	}
	
	method cantComidasCarnivoras(){
		return self.menuCarnivoro().size()
	}
	
	method buenaOfertaVegetariana(){
		return (self.cantComidasVegetarianas() - self.cantComidasCarnivoras()).abs() <= 2
	}
	
	method mejorPlatoCarnivoro(){
		return self.menuCarnivoro().max({c => c.valoracion()})
	}
	
	method comidasQueLeGustanA(comensal){
		return comidasPreparadas.filter({c => comensal.leAgrada(c)})
	}
	
	method servirPlatoAComensal(comensal){
		if (self.comidasQueLeGustanA(comensal).isEmpty()){
			self.error("Al comensal no le gusta ninguna comida")
		}else{
			const comidaAServir = self.comidasQueLeGustanA(comensal).anyOne()
			comensal.comer(comidaAServir)
			self.entregarComida(comidaAServir)
		}
		
		
	}
}