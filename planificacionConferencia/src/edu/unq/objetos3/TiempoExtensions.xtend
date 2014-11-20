package edu.unq.objetos3

import edu.unq.objetos3.planificacionConferencia.Tiempo
import edu.unq.objetos3.planificacionConferencia.PlanificacionConferenciaFactory

class TiempoExtensions {
	static def enMinutos(Tiempo tiempo) { 
		tiempo.horas * 60 + tiempo.minutos
	}
	
	static def +(Tiempo uno, Tiempo otro) {
		(uno.enMinutos + otro.enMinutos).minutos
	}
	
	static def asString(Tiempo uno) '''
		«IF uno.horas > 0»«uno.horas»h«ENDIF»«IF uno.minutos > 0»«uno.minutos»m«ENDIF»
	'''
	
	// Comparison
	
	static def >(Tiempo uno, Tiempo otro) {
		uno.enMinutos > otro.enMinutos
	}
	
	static def <(Tiempo uno, Tiempo otro) {
		uno.enMinutos < otro.enMinutos
	}
	
	static def <=(Tiempo uno, Tiempo otro) {
		uno < otro || uno == otro
	}
	
	static def ==(Tiempo uno, Tiempo otro) {
		uno.horas == otro.horas && uno.minutos == otro.minutos
	}
	
	// Constructors
	
	static def newTiempo(int horas, int minutos) {
		PlanificacionConferenciaFactory.eINSTANCE.createTiempo() => [ 
			it.horas = horas
			it.minutos = minutos
		]
	}
	
	static def horas(int horas) {
		newTiempo(horas, 0)
	}
	
	static def minutos(int minutos) {
		newTiempo(minutos / 60, minutos % 60)
	}
}