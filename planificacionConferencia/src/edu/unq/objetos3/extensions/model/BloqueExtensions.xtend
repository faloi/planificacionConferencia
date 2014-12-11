package edu.unq.objetos3.extensions.model

import edu.unq.objetos3.planificacionConferencia.Actividad
import edu.unq.objetos3.planificacionConferencia.Bloque
import edu.unq.objetos3.planificacionConferencia.Espacio
import edu.unq.objetos3.planificacionConferencia.IntervaloTiempo
import edu.unq.objetos3.planificacionConferencia.Orador

import static extension edu.unq.objetos3.extensions.collections.IterableExtensions.*
import static extension edu.unq.objetos3.extensions.model.ActividadExtensions.*
import static extension edu.unq.objetos3.extensions.model.EspacioExtensions.*
import static extension edu.unq.objetos3.extensions.model.HoraExtensions.*
import static extension edu.unq.objetos3.extensions.model.IntervaloTiempoExtensions.*

class BloqueExtensions {
	static def actividadesValidas(Bloque bloque) {
		bloque.actividades.filter[name != null]
	}
	
	static def tracks(Bloque bloque) {
		bloque.actividadesValidas.map[track].toSet
	}	
	
	static def IntervaloTiempo duracion(Bloque bloque) {
		bloque.actividadesValidas.duracionTotal
	}
	
	static def esLaPrimera(Bloque bloque, Actividad actividad) {
		bloque.actividades.indexOf(actividad) == 0
	}
	
	static def organizaciones(Bloque bloque) {
		bloque.actividadesValidas.flatMap[organizaciones]
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
	
	static def cantidadDeVecesPlanificada(Bloque bloque, Actividad actividad) {
		bloque.actividades.filter[it == actividad].length
	}	
	
	static def actividadesPorOrganizacion(Bloque bloque) {
		bloque.organizaciones.toInvertedMap[
			bloque.actividadesDeOrganizacion(it)			
		]
	}
	
	static def actividadesDeOrganizacion(Bloque bloque, String organizacion) {
		bloque.actividadesValidas.filter[organizaciones.contains(organizacion)]
	}
	
	static def actividadesDe(Bloque bloque, Orador orador) {
		bloque.actividadesValidas.filter[tieneComoOradorA(orador)]
	}
	
	static def tieneComoOradorA(Bloque bloque, Orador orador) {
		bloque.actividadesValidas.exists[tieneComoOradorA(orador)]
	}	
	
	static def horarioDe(Bloque bloque, Actividad actividad) {
		val duracionAnteriores = bloque.actividades.takeWhile[it != actividad].duracionTotal
		val inicio = bloque.horario.inicio + duracionAnteriores
		
		new Horario(inicio, inicio + actividad.duracion)
	}
	
	static def horario(Bloque bloque) {
		bloque.espacio.horarioDe(bloque)
	}
	
	static def duracionTotal(Iterable<Actividad> actividades) {
		actividades.fold(0.minutos) [acum, elem | acum + elem.duracion]
	}
}