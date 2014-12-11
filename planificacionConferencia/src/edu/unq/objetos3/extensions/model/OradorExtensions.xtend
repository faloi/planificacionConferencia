package edu.unq.objetos3.extensions.model

import edu.unq.objetos3.planificacionConferencia.Orador
import edu.unq.objetos3.planificacionConferencia.Schedule

import static extension edu.unq.objetos3.extensions.collections.IterableExtensions.*
import static extension edu.unq.objetos3.extensions.model.ActividadExtensions.*
import static extension edu.unq.objetos3.extensions.model.BloqueExtensions.*
import static extension edu.unq.objetos3.extensions.model.EspacioExtensions.*
import static extension edu.unq.objetos3.extensions.model.ScheduleExtensions.*

class OradorExtensions {
	static def actividadesSolapadasEn(Orador orador, Iterable<Schedule> schedules) {
		schedules.flatMap[orador.actividadesSolapadasEn(it)]
	} 
	
	static def actividadesSolapadasEn(Orador orador, Schedule schedule) {
		val actividades = orador.actividadesEn(schedule)
		actividades.filter [actividad |
			actividades.except(actividad).exists[it.seSolapaCon(actividad, schedule.bloqueDe(it), schedule.bloqueDe(actividad))]
		]
	}
	
	static def actividadesEn(Orador orador, Schedule schedule) {
		schedule.espacios
			.flatMap[bloques]
			.flatMap[actividadesDe(orador)]
	} 
}