package edu.unq.objetos3.extensions.model

import edu.unq.objetos3.planificacionConferencia.Actividad
import edu.unq.objetos3.planificacionConferencia.ActividadAccesoria
import edu.unq.objetos3.planificacionConferencia.ActividadesPorEspacio
import edu.unq.objetos3.planificacionConferencia.Bloque
import edu.unq.objetos3.planificacionConferencia.Espacio

import static extension edu.unq.objetos3.extensions.model.BloqueExtensions.*
import static extension edu.unq.objetos3.extensions.model.IntervaloTiempoExtensions.*
import static extension edu.unq.objetos3.extensions.model.HoraExtensions.*

class EspacioExtensions {
	static def contiene(Espacio espacio, Actividad actividad) {
		espacio.actividades.filter(Bloque).exists[contiene(actividad)]
	}
	
	static def horaInicioDe(Espacio espacio, ActividadesPorEspacio actividad) {
		val duracionAnteriores = espacio.actividades
			.takeWhile[it != actividad]
			.fold(0.minutos) [acum, elem | acum + getDuracion(elem)]
			
		espacio.horaInicio + duracionAnteriores
	}
		
	def static getDuracion(ActividadesPorEspacio actividad) {
		if (actividad instanceof ActividadAccesoria)
			(actividad as ActividadAccesoria).duracion
		else
			(actividad as Bloque).duracion
	}
}