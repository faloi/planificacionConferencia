package edu.unq.objetos3

import edu.unq.objetos3.planificacionConferencia.Bloque

class BloqueExtensions {
	static def actividadesValidas(Bloque bloque) {
		bloque.actividades.filter[name != null]
	}
	
	static def tracks(Bloque bloque) {
		bloque.actividadesValidas.map[track].toSet
	}	
}