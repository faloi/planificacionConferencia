package edu.unq.objetos3

import edu.unq.objetos3.planificacionConferencia.Bloque
import edu.unq.objetos3.planificacionConferencia.PlanificacionConferenciaFactory
import static extension edu.unq.objetos3.IntervaloTiempoExtensions.*

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
}