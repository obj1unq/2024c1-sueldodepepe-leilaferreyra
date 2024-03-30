//EMPLEADOS 
object pepe {

	var property categoria = cadete  
	var bonoXResultados = bonoXResultadosNulo
	var bonoXPresentismo = bonoXPresentismoNulo
	var property faltas = 0
	var property ventas = "ninguna"

	method sueldo() {
		return self.neto() + self.bonoXResultados() + self.bonoXPresentismo()
	}

	method neto() {
		return categoria.neto(self)
	}

	method bonoXResultados(_bonoXResultados) {
		bonoXResultados = _bonoXResultados
	}

	method bonoXResultados() {
		return bonoXResultados.valor(self)
	}

	method bonoXPresentismo() {
		return bonoXPresentismo.valor(self)
	}

	method bonoXPresentismo(_bonoXPresentismo) {
		bonoXPresentismo = _bonoXPresentismo
	}

	method asistenciaPerfecta() {
		return self.faltas() == 0
	}

}

object sofia {

	var property categoria = cadete
	var bonoXResultados = bonoXResultadosNulo
	var property ventas = "ninguna"

	method sueldo() {
		return self.neto() + self.bonoXResultados()
	}

	method neto() {
		return categoria.neto(self) * 1.3
	}

	method bonoXResultados() {
		return bonoXResultados.valor(self)
	}

	method bonoXResultados(_bonoXResultados) {
		bonoXResultados = _bonoXResultados
	}

}

object roque {

	var bonoXResultados = bonoXResultadosNulo
	const sueldoFijo = 9000
	const property neto = 28000 

	method sueldo() {
		return neto + self.bonoXResultados() + sueldoFijo 
	}

	method bonoXResultados() {
		return bonoXResultados.valor(self)
	}

	method bonoXResultados(_bonoXResultados) {
		bonoXResultados = _bonoXResultados
	}

}

object ernesto {

	const property faltas = 0
	var property companero = pepe
	var bonoXPresentismo = bonoXPresentismoNulo

	method sueldo() {
		return companero.neto() + self.bonoXPresentismo()
	}

	method neto() {
		return companero.neto()
	}

	method categoria() {
		return companero.categoria()
	}

	method bonoXPresentismo() {
		return bonoXPresentismo.valor(self)
	}

	method bonoXPresentismo(_bonoXPresentismo) {
		bonoXPresentismo = _bonoXPresentismo
	}

	method asistenciaPerfecta() {
		return self.faltas() == 0
	}

}

//CATEGORIAS 
object gerente {

	method neto(empleado) {
		return 15000
	}

}

object cadete {

	method neto(empleado) {
		return 20000
	}

}

object vendedor {

	method neto(empleado) {
		return if (self.tieneMuchasVentas(empleado)) {
			self.activarAumentoPorMuchasVentas()
		} else {
			self.desactivarAumentoPorMuchasVentas()
		}
	}

	method tieneMuchasVentas(empleado) {
		return empleado.ventas() == "muchasVentas"
	}

	method activarAumentoPorMuchasVentas() {
		return 16000 * 1.25
	}

	method desactivarAumentoPorMuchasVentas() {
		return 16000
	}

}

object medioTiempo {

	var property categoriaBase = cadete

	method neto(empleado) {
		return categoriaBase.neto(empleado) / 2
	}

}

//BONOXRESULTADOS 
object bonoPorcentaje {

	method valor(empleado) {
		return empleado.neto() / 10
	}

}

object bonoMontoFijo {

	method valor(empleado) {
		return 800
	}

}

object bonoXResultadosNulo {

	method valor(empleado) {
		return 0
	}

}

//BONOXPRESENTISMO
object bonoNormal {

	method valor(empleado) {
		return if (empleado.asistenciaPerfecta()) {
			2000
		} else if (empleado.faltas() == 1) {
			1000
		} else {
			0
		}
	}

}

object bonoAjuste {

	method valor(empleado) {
		return if (empleado.asistenciaPerfecta()) 100 else 0
	}

}

object bonoDemagogico {

	method valor(empleado) {
		return if (empleado.neto() < 18000) 500 else 300
	}

}

object bonoXPresentismoNulo {

	method valor(empleado) {
		return 0
	}

}

