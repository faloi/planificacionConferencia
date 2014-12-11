package edu.unq.objetos3.extensions.model

import edu.unq.objetos3.planificacionConferencia.Actividad
import edu.unq.objetos3.planificacionConferencia.ActividadAccesoria
import edu.unq.objetos3.planificacionConferencia.ActividadesPorEspacio
import edu.unq.objetos3.planificacionConferencia.Bloque
import edu.unq.objetos3.planificacionConferencia.Espacio

import static extension edu.unq.objetos3.extensions.model.BloqueExtensions.*
import static extension edu.unq.objetos3.extensions.model.HoraExtensions.*
import static extension edu.unq.objetos3.extensions.model.IntervaloTiempoExtensions.*
import static extension edu.unq.objetos3.extensions.collections.IterableExtensions.*

class EspacioExtensions {
	static def bloques(Espacio espacio) {
		espacio.actividades.filter(Bloque)	
	}
	
	static def contiene(Espacio espacio, Actividad actividad) {
		espacio.bloques.exists[contiene(actividad)]
	}
	
	static def cantidadDeVecesPlanificada(Espacio espacio, Actividad actividad) {
		espacio.bloques.sum[cantidadDeVecesPlanificada(actividad)]
	}
	
	static def horarioDe(Espacio espacio, ActividadesPorEspacio actividad) {
		val duracionAnteriores = espacio.actividades
			.takeWhile[it != actividad]
			.fold(0.minutos) [acum, elem | acum + getDuracion(elem)]
			
		val horaInicio = espacio.horaInicio + duracionAnteriores
		
		new Horario(horaInicio, horaInicio + actividad.getDuracion)
	}
		
	def static dispatch getDuracion(ActividadAccesoria actividad) {
		actividad.duracion
	}
	
	def static dispatch getDuracion(Bloque actividad) {
		actividad.duracion
	}
}