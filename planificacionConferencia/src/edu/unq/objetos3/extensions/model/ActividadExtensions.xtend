package edu.unq.objetos3.extensions.model

import edu.unq.objetos3.planificacionConferencia.Actividad

class ActividadExtensions {
	static def organizaciones(Actividad actividad) {
		actividad.oradores.map[organizacion].toSet
	}
}