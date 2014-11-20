package edu.unq.objetos3

import edu.unq.objetos3.planificacionConferencia.Tiempo

class TiempoExtensions {
	static def enMinutos(Tiempo tiempo) {
		tiempo.horas * 60 + tiempo.minutos
	}
}