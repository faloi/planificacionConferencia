package edu.unq.objetos3.extensions.model

import edu.unq.objetos3.planificacionConferencia.Fecha
import edu.unq.objetos3.planificacionConferencia.PlanificacionConferenciaFactory
import java.util.Calendar

class FechaExtensions {
	def static asString(Fecha fecha) '''
		«fecha.dia»/«fecha.mes»/«fecha.anio»
	'''
	
	def static diaDeSemana(Fecha fecha) {
		val calendar = Calendar.getInstance() => [
			time = fecha.asDate
		]
		
		switch (calendar.get(Calendar.DAY_OF_WEEK)) {
			case Calendar.SUNDAY: "Domingo"
			case Calendar.MONDAY: "Lunes"
			case Calendar.TUESDAY: "Martes"
			case Calendar.WEDNESDAY: "Miércoles"
			case Calendar.THURSDAY: "Jueves"
			case Calendar.FRIDAY: "Viernes"
			case Calendar.SATURDAY: "Sábado"
		}
	}
	
	def static asDate(Fecha fecha) {
		val calendar = Calendar.getInstance() => [
			set(Calendar.YEAR, fecha.anio)
			set(Calendar.MONTH, fecha.mes - 1)
			set(Calendar.DAY_OF_MONTH, fecha.dia)
		]
		
		calendar.time		
	}
	
	static def newFecha(int dia, int mes, int anio) {
		PlanificacionConferenciaFactory.eINSTANCE.createFecha() => [ 
			it.dia = dia
			it.mes = mes
			it.anio = anio
		]
	}
}