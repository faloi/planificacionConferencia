package edu.unq.objetos3.extensions.model

import edu.unq.objetos3.planificacionConferencia.Actividad
import edu.unq.objetos3.planificacionConferencia.Bloque
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
	
 	static def actividadesAdyacentesEn(Orador orador, Iterable<Schedule> schedules) {
		schedules.flatMap[orador.actividadesAdyacentesEn(it)]
	} 
	
	static def actividadesSolapadasEn(Orador orador, Schedule schedule) {
		actividadesEn(orador, schedule, [act1, act2, bloque1, bloque2 |
			act1.seSolapaCon(act2, bloque1, bloque2)
		])
	}
	
	static def actividadesAdyacentesEn(Orador orador, Schedule schedule) {
		actividadesEn(orador, schedule, [act1, act2, bloque1, bloque2 |
			act1.esAdyacenteCon(act2, bloque1, bloque2)
		])
	}	
	
	static def actividadesEn(Orador orador, Schedule schedule, (Actividad, Actividad, Bloque, Bloque) => boolean predicate) {
		val actividades = orador.actividadesEn(schedule)
		actividades.filter [actividad |
			actividades.except(actividad).exists[predicate.apply(it, actividad, schedule.bloqueDe(it), schedule.bloqueDe(actividad))]
		]		
	}
	
	static def actividadesEn(Orador orador, Schedule schedule) {
		schedule.espacios
			.flatMap[bloques]
			.flatMap[actividadesDe(orador)]
	} 
}