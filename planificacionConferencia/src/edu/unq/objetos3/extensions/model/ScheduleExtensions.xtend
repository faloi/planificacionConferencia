package edu.unq.objetos3.extensions.model

import edu.unq.objetos3.planificacionConferencia.Schedule
import edu.unq.objetos3.planificacionConferencia.Actividad

import static extension edu.unq.objetos3.extensions.model.EspacioExtensions.*

class ScheduleExtensions {
	static def contiene(Schedule schedule, Actividad actividad) {
		schedule.espacios.exists[contiene(actividad)]
	}
}