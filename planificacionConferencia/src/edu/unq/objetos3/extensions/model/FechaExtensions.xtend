package edu.unq.objetos3.extensions.model

import edu.unq.objetos3.planificacionConferencia.Fecha
import java.util.Date
import java.util.Calendar
import java.text.SimpleDateFormat
import edu.unq.objetos3.planificacionConferencia.PlanificacionConferenciaFactory

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
		new Date(fecha.anio, fecha.mes, fecha.dia)
	}
	
	static def newFecha(int dia, int mes, int anio) {
		PlanificacionConferenciaFactory.eINSTANCE.createFecha() => [ 
			it.dia = dia
			it.mes = mes
			it.anio = anio
		]
	}
}