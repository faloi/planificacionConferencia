package edu.unq.objetos3.extensions.model

import edu.unq.objetos3.planificacionConferencia.Actividad
import edu.unq.objetos3.planificacionConferencia.Schedule

import static extension edu.unq.objetos3.extensions.collections.IterableExtensions.*
import static extension edu.unq.objetos3.extensions.model.BloqueExtensions.*
import static extension edu.unq.objetos3.extensions.model.EspacioExtensions.*

class ScheduleExtensions {
	static def contiene(Schedule schedule, Actividad actividad) {
		schedule.espacios.exists[contiene(actividad)]
	}
	
	static def bloqueDe(Schedule schedule, Actividad actividad) {
		schedule.espacios.flatMap[bloques].findFirst[contiene(actividad)]
	}
}