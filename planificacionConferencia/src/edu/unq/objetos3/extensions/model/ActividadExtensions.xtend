package edu.unq.objetos3.extensions.model

import edu.unq.objetos3.planificacionConferencia.Actividad
import edu.unq.objetos3.planificacionConferencia.Bloque
import edu.unq.objetos3.planificacionConferencia.Orador

import static extension edu.unq.objetos3.extensions.model.BloqueExtensions.*

class ActividadExtensions {
	static def organizaciones(Actividad actividad) {
		actividad.oradores.map[organizacion].toSet
	}
	
	//TODO Horrible, pero no logre llegar al bloque desde la actividad :(
	static def seSolapaCon(Actividad actividad, Actividad otra, Bloque bloque, Bloque bloqueOtra) {
		bloque.horarioDe(actividad).overlaps(bloqueOtra.horarioDe(otra))
	}
	
	static def tieneComoOradorA(Actividad actividad, Orador orador) {
		actividad.oradores.exists[nombre == orador.nombre]
	}
}