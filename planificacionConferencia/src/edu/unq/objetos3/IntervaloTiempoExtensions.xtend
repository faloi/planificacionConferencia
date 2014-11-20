package edu.unq.objetos3

import edu.unq.objetos3.planificacionConferencia.IntervaloTiempo
import edu.unq.objetos3.planificacionConferencia.PlanificacionConferenciaFactory

class IntervaloTiempoExtensions {
	static def enMinutos(IntervaloTiempo intervaloTiempo) { 
		intervaloTiempo.horas * 60 + intervaloTiempo.minutos
	}
	
	static def +(IntervaloTiempo uno, IntervaloTiempo otro) {
		(uno.enMinutos + otro.enMinutos).minutos
	}
	
	static def asString(IntervaloTiempo uno) '''
		«IF uno.horas > 0»«uno.horas»h«ENDIF»«IF uno.minutos > 0»«uno.minutos»m«ENDIF»
	'''
	
	// Comparison
	
	static def >(IntervaloTiempo uno, IntervaloTiempo otro) {
		uno.enMinutos > otro.enMinutos
	}
	
	static def <(IntervaloTiempo uno, IntervaloTiempo otro) {
		uno.enMinutos < otro.enMinutos
	}
	
	static def <=(IntervaloTiempo uno, IntervaloTiempo otro) {
		uno < otro || uno == otro
	}
	
	static def ==(IntervaloTiempo uno, IntervaloTiempo otro) {
		uno.horas == otro.horas && uno.minutos == otro.minutos
	}
	
	// Constructors
	
	static def newIntervaloTiempo(int horas, int minutos) {
		PlanificacionConferenciaFactory.eINSTANCE.createIntervaloTiempo() => [ 
			it.horas = horas
			it.minutos = minutos
		]
	}
	
	static def horas(int horas) {
		newIntervaloTiempo(horas, 0)
	}
	
	static def minutos(int minutos) {
		newIntervaloTiempo(minutos / 60, minutos % 60)
	}
}