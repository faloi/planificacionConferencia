package edu.unq.objetos3.extensions.model

import edu.unq.objetos3.planificacionConferencia.Actividad
import edu.unq.objetos3.planificacionConferencia.Bloque
import edu.unq.objetos3.planificacionConferencia.Espacio

import static extension edu.unq.objetos3.extensions.model.IntervaloTiempoExtensions.*

class BloqueExtensions {
	static def actividadesValidas(Bloque bloque) {
		bloque.actividades.filter[name != null]
	}
	
	static def tracks(Bloque bloque) {
		bloque.actividadesValidas.map[track].toSet
	}	
	
	static def duracion(Bloque bloque) {
		bloque.actividadesValidas.fold(0.minutos) [acum, elem | acum + elem.duracion]
	}
	
	static def espacio(Bloque bloque) {
		bloque.eContainer as Espacio
	}
	
	static def capacidadAprovechadaPor(Bloque bloque, Actividad actividad) {
		actividad.capacidadMaxima.floatValue / bloque.espacio.capacidad
	}
	
	static def contiene(Bloque bloque, Actividad actividad) {
		bloque.actividades.contains(actividad)
	}
}