package edu.unq.objetos3.extensions.model

import edu.unq.objetos3.planificacionConferencia.Actividad
import edu.unq.objetos3.planificacionConferencia.Bloque
import edu.unq.objetos3.planificacionConferencia.Espacio

import static extension edu.unq.objetos3.extensions.model.BloqueExtensions.*

class EspacioExtensions {
	static def contiene(Espacio espacio, Actividad actividad) {
		espacio.actividades.filter(Bloque).exists[contiene(actividad)]
	}
}