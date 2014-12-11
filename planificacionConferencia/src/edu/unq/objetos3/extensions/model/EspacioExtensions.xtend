package edu.unq.objetos3.extensions.model

import edu.unq.objetos3.planificacionConferencia.Actividad
import edu.unq.objetos3.planificacionConferencia.ActividadAccesoria
import edu.unq.objetos3.planificacionConferencia.ActividadesPorEspacio
import edu.unq.objetos3.planificacionConferencia.Bloque
import edu.unq.objetos3.planificacionConferencia.Charla
import edu.unq.objetos3.planificacionConferencia.Debate
import edu.unq.objetos3.planificacionConferencia.Espacio
import edu.unq.objetos3.planificacionConferencia.Taller

import static extension edu.unq.objetos3.extensions.collections.IterableExtensions.*
import static extension edu.unq.objetos3.extensions.model.BloqueExtensions.*
import static extension edu.unq.objetos3.extensions.model.HoraExtensions.*
import static extension edu.unq.objetos3.extensions.model.IntervaloTiempoExtensions.*

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

	static def actividadesSolapadasCon(Espacio espacio, Actividad actividad) {
		espacio.bloques.flatMap[actividadesSolapadasCon(actividad)]
	}
	
	static def horarioDe(Espacio espacio, ActividadesPorEspacio actividad) {
		val duracionAnteriores = espacio.actividades
			.takeWhile[it != actividad]
			.fold(0.minutos) [acum, elem | acum + getDuracion(elem)]
			
		val horaInicio = espacio.horaInicio + duracionAnteriores
		
		new Horario(horaInicio, horaInicio + actividad.getDuracion)
	}
	
	static def hayTalleres(Espacio espacio) {
		!espacio.bloques.flatMap[actividades].filter(Taller).empty
	}
	
	static def hayCharlasODebates(Espacio espacio) {
		espacio.bloques.flatMap[actividades].exists[it instanceof Charla || it instanceof Debate]
	}
	
	static def hayComputadoras(Espacio espacio) {
		espacio.computadoras != 0
	}
		
	def static dispatch getDuracion(ActividadAccesoria actividad) {
		actividad.duracion
	}
	
	def static dispatch getDuracion(Bloque actividad) {
		actividad.duracion
	}
}