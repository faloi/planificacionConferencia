package edu.unq.objetos3

import edu.unq.objetos3.planificacionConferencia.Actividad
import edu.unq.objetos3.planificacionConferencia.Tiempo

class ActividadExtensions {
	static def organizaciones(Actividad actividad) {
		actividad.oradores.map[organizacion].toSet
	}
}