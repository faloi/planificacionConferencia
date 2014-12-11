package edu.unq.objetos3.extensions.model

import edu.unq.objetos3.planificacionConferencia.Hora
import org.eclipse.xtend.lib.annotations.Accessors

import static extension edu.unq.objetos3.extensions.model.HoraExtensions.*
import edu.unq.objetos3.planificacionConferencia.IntervaloTiempo

class Horario {
	@Accessors Hora inicio
	@Accessors Hora fin
	
	new(Hora inicio, Hora fin) {
		this.inicio = inicio
		this.fin = fin
	}
	
	def +(IntervaloTiempo duracion) {
		new Horario(inicio + duracion, fin + duracion)
	}
	
	def overlaps(Horario otro) {
		inicio >= otro.inicio && inicio < otro.fin
		|| fin > otro.inicio && fin <= otro.fin
	}
	
	def abuts(Horario otro) {
		!overlaps(otro) && (inicio == otro.fin || fin == otro.inicio)
	}	
	
	override toString() '''
		«inicio.asString» - «fin.asString»
	'''
}