import wollok.game.*
object pachamama {
	var property position = game.origin()
	var property image = "pachamama-agradecida.png"
	var nivelAgradecimiento = 10
	
	method llover(){
		nivelAgradecimiento += 5
	}
	method tirarBasura() {
		nivelAgradecimiento = 0.max(nivelAgradecimiento - 10)
	}
	
	method fumigar() {
		nivelAgradecimiento = 0
	}
	
	method abonar () {
		nivelAgradecimiento *= 2
	}
	
	method estaAgradecida() = nivelAgradecimiento >= 10
}
