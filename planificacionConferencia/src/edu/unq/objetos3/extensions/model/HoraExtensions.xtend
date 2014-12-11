package edu.unq.objetos3.extensions.model

import edu.unq.objetos3.planificacionConferencia.Hora
import edu.unq.objetos3.planificacionConferencia.IntervaloTiempo
import edu.unq.objetos3.planificacionConferencia.PlanificacionConferenciaFactory
import java.text.SimpleDateFormat
import java.util.Calendar

import static extension edu.unq.objetos3.extensions.model.IntervaloTiempoExtensions.*

class HoraExtensions {
	static def +(Hora hora, IntervaloTiempo tiempo) {
		val minutos = hora.enMinutos + tiempo.enMinutos
		newHora(minutos / 60, minutos % 60)
	}

	static def <(Hora una, Hora otra) {
		una.enMinutos < otra.enMinutos
	}
	
	static def >(Hora una, Hora otra) {
		una.enMinutos > otra.enMinutos
	}
	
	static def ==(Hora una, Hora otra) {
		una.enMinutos == otra.enMinutos
	}
	
	static def <=(Hora una, Hora otra) {
		una < otra || una == otra
	}
	
	static def >=(Hora una, Hora otra) {
		una > otra || una == otra
	}	

	static def enMinutos(Hora hora) {
		hora.hora * 60 + hora.minutos
	}

	static def asString(Hora hora) {
		val calendar = Calendar.instance => [
			set(Calendar.HOUR_OF_DAY, hora.hora)
			set(Calendar.MINUTE, hora.minutos)	
		]
		
		new SimpleDateFormat("HH:mm").format(calendar.time)
	}
	
	static def newHora(int hora, int minutos) {
		PlanificacionConferenciaFactory.eINSTANCE.createHora() => [ 
			it.hora = hora
			it.minutos = minutos
		]
	}	
}