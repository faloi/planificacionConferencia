/*
 * generated by Xtext
 */
package edu.unq.objetos3.validation

import edu.unq.objetos3.planificacionConferencia.Actividad
import edu.unq.objetos3.planificacionConferencia.Almuerzo
import edu.unq.objetos3.planificacionConferencia.Bloque
import edu.unq.objetos3.planificacionConferencia.Break
import edu.unq.objetos3.planificacionConferencia.Charla
import edu.unq.objetos3.planificacionConferencia.Debate
import edu.unq.objetos3.planificacionConferencia.Descanso
import edu.unq.objetos3.planificacionConferencia.Espacio
import edu.unq.objetos3.planificacionConferencia.IntervaloTiempo
import edu.unq.objetos3.planificacionConferencia.PlanificacionConferenciaPackage
import org.eclipse.emf.ecore.EReference
import org.eclipse.xtext.validation.Check

import static extension edu.unq.objetos3.ActividadExtensions.*
import static extension edu.unq.objetos3.BloqueExtensions.*
import static extension edu.unq.objetos3.IntervaloTiempoExtensions.*

/**
 * Custom validation rules. 
 *
 * see http://www.eclipse.org/Xtext/documentation.html#validation
 */
class PlanificacionConferenciaValidator extends AbstractPlanificacionConferenciaValidator {
	@Check
	def checkDuracionMinimaCharla(Charla charla) {
		checkDuracionMinima(charla, 30.minutos)
	}

	@Check
	def checkDuracionMinimaDebate(Debate debate) {
		checkDuracionMinima(debate, 1.horas)
	}
	
	@Check
	def checkDuracionMinimaBreak(Almuerzo almuerzo) {
		checkDuracionMinima(almuerzo, 45.minutos)
	}

	@Check
	def checkDuracionMinimaBreak(Break break) {
		checkDuracionMinima(break, 15.minutos)
	}

	@Check
	def checkAlMenosDosOradoresEnDebate(Debate debate) {
		if (debate.oradores.length < 2) {
			error('Un debate tiene que tener al menos 2 oradores', 
					PlanificacionConferenciaPackage.Literals.ACTIVIDAD__ORADORES) 
		}
	}
	
	@Check
	def checkOradoresDeDistintaOrganizacionEnDebate(Debate debate) {
		if (debate.organizaciones.length < debate.oradores.length) {
			error('Los oradores tienen que ser de distintas organizaciones', 
					PlanificacionConferenciaPackage.Literals.ACTIVIDAD__ORADORES) 
		}
	}
	
	@Check
	def checkTodoElBloqueEsDelMismoTrack(Bloque bloque) {
		if (bloque.tracks.length > 1) 
			error('''Todas las charlas del bloque deben ser del mismo track, pero hay de: «bloque.tracks.join(", ")»''',
				PlanificacionConferenciaPackage.Literals.BLOQUE__ACTIVIDADES)
	}
	
	@Check
	def checkBloqueNoDuraMasDeDosHoras(Bloque bloque) {
		if (bloque.duracion > 2.horas) 
			error('''No puede durar más de 2 horas, pero dura «bloque.duracion.asString»''', 
				PlanificacionConferenciaPackage.Literals.BLOQUE__ACTIVIDADES)
	}	
	
	@Check
	def checkCantidadAsistentes(Bloque bloque) {
		val espacio = bloque.espacio
		
		bloque.actividadesValidas.forEach [
			val capacidadAprovechada = bloque.capacidadAprovechadaPor(it) 
			
			switch (capacidadAprovechada) {
				case capacidadAprovechada > 1:
					error('''
						Esta actividad necesita espacio para al menos «capacidadMaxima» personas, 
						pero en «espacio.nombre» solo entran «espacio.capacidad»
					''', 
					PlanificacionConferenciaPackage.Literals.BLOQUE__ACTIVIDADES,
					bloque.actividades.indexOf(it))
					
				case capacidadAprovechada > 0.9:				
					warning('''
						Esta actividad espera recibir mas del 90% de la capacidad de «espacio.nombre», 
						(quizás podría reubicarse en un espacio más grande?)
					''', 
					PlanificacionConferenciaPackage.Literals.BLOQUE__ACTIVIDADES,
					bloque.actividades.indexOf(it))				
					
				case capacidadAprovechada < 0.5:				
					warning('''
						Esta actividad espera recibir menos del 50% de la capacidad de «espacio.nombre», 
						(quizás podría reubicarse en un espacio más chico?)
					''', 
					PlanificacionConferenciaPackage.Literals.BLOQUE__ACTIVIDADES,
					bloque.actividades.indexOf(it))									
			}
		]
	}
	
	@Check
	def checkTodasLasActividadesEstanEnElSchedule(Actividad actividad) {
		
	}		
	
	protected def checkDuracionMinima(Descanso descanso, IntervaloTiempo duracionMinima) {
		checkDuracionMinima(descanso.duracion, duracionMinima, PlanificacionConferenciaPackage.Literals.DESCANSO__DURACION) 
	}	
	
	protected def checkDuracionMinima(Actividad actividad, IntervaloTiempo duracionMinima) {
		checkDuracionMinima(actividad.duracion, duracionMinima, PlanificacionConferenciaPackage.Literals.ACTIVIDAD__DURACION)
	}
	
	protected def checkDuracionMinima(IntervaloTiempo duracion, IntervaloTiempo duracionMinima, EReference reference) {
		if (duracion < duracionMinima)
			error('''No puede durar menos de «duracionMinima.asString»''', reference)
	}
}
