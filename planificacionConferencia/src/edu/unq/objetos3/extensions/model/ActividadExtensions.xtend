package edu.unq.objetos3.extensions.model

import edu.unq.objetos3.planificacionConferencia.Actividad
import edu.unq.objetos3.planificacionConferencia.Bloque
import edu.unq.objetos3.planificacionConferencia.Model
import edu.unq.objetos3.planificacionConferencia.Orador

import static extension edu.unq.objetos3.extensions.model.BloqueExtensions.*
import static extension edu.unq.objetos3.extensions.model.ScheduleExtensions.*

class ActividadExtensions {
	static def organizaciones(Actividad actividad) {
		actividad.oradores.map[organizacion].toSet
	}
	
	static def seSolapaCon(Actividad actividad, Actividad otra) {
		actividad.horario.overlaps(otra.horario)
	}
	
	static def esAdyacenteCon(Actividad actividad, Actividad otra) {
		actividad.horario.abuts(otra.horario)
	}
	
	static def tieneComoOradorA(Actividad actividad, Orador orador) {
		actividad.oradores.exists[nombre == orador.nombre]
	}
	
	static def horario(Actividad actividad) {
		val model = actividad.eContainer as Model
		val bloque = model.schedules.map[bloqueDe(actividad)].filterNull.head
		
		bloque.horarioDe(actividad)		
	}
}