import wollok.game.*
import plantas.*
object toni {
	
	var property position = game.center()
	const property image = "toni.png"
	const plantasSembradas = []
	const plantasCosechadas = []
	var monedas = 0
	
	method monedas() = monedas
	
	method plantar(unaPlanta) {
		plantasSembradas.add(unaPlanta)
	} 
	
	method regarLasPlantas() {
		plantasSembradas.forEach{planta => self.regar(planta)}
	}
	method regar(unaPlanta) {
		unaPlanta.regate()
	}
	
	
	method cosecharTodo(plantasListasParaCosechar) {
		plantasListasParaCosechar.forEach {
			planta=> self.cosechar(planta)
		}
	}
	
	method cosechar(unaPlanta){
		plantasSembradas.remove(unaPlanta)
		plantasCosechadas.add(unaPlanta)

	}
	
	method plantasListasParaCosechar() {
		return plantasSembradas.filter { planta => planta.estaLista()}
	}
	
	method venderCosecha() {
		monedas += self.valorDeCosecha()
		plantasCosechadas.clear()
	}
	
	method paraCuantosDiasLeAlcanza() {
		return (monedas + self.valorDeCosecha()).div(200)
	}
	
	method valorDeCosecha() = plantasCosechadas.sum { planta => planta.valor() }
	
	method cuantoHayParaCeliacos() = 
		self
		.plantasListasParaCosechar()
		.count { planta => not planta.tieneGluten() }

	method convieneRegar() = plantasSembradas.any { planta => not planta.estaLista() }
}