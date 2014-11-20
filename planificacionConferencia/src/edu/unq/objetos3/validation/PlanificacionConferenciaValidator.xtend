/*
 * generated by Xtext
 */
package edu.unq.objetos3.validation

import static extension edu.unq.objetos3.BloqueExtensions.*
import static extension edu.unq.objetos3.ActividadExtensions.*
import edu.unq.objetos3.planificacionConferencia.Actividad
import edu.unq.objetos3.planificacionConferencia.Almuerzo
import edu.unq.objetos3.planificacionConferencia.Bloque
import edu.unq.objetos3.planificacionConferencia.Break
import edu.unq.objetos3.planificacionConferencia.Charla
import edu.unq.objetos3.planificacionConferencia.Debate
import edu.unq.objetos3.planificacionConferencia.Descanso
import edu.unq.objetos3.planificacionConferencia.PlanificacionConferenciaPackage
import org.eclipse.xtext.validation.Check
/**
 * Custom validation rules. 
 *
 * see http://www.eclipse.org/Xtext/documentation.html#validation
 */
class PlanificacionConferenciaValidator extends AbstractPlanificacionConferenciaValidator {
	@Check
	def checkDuracionMinimaCharla(Charla charla) {
		checkDuracionMinima(charla, 30)
	}

	@Check
	def checkDuracionMinimaDebate(Debate debate) {
		checkDuracionMinima(debate, 60)
	}
	
	@Check
	def checkDuracionMinimaBreak(Almuerzo almuerzo) {
		checkDuracionMinima(almuerzo, 45)
	}

	@Check
	def checkDuracionMinimaBreak(Break break) {
		checkDuracionMinima(break, 15)
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
	
	protected def checkDuracionMinima(Descanso descanso, int duracionMinima) {
		if (descanso.duracion < duracionMinima) {
			error('''No puede durar menos de «duracionMinima» minutos''', 
					PlanificacionConferenciaPackage.Literals.DESCANSO__DURACION) 
		}
	}	
	
	protected def checkDuracionMinima(Actividad actividad, int duracionMinima) {
		if (actividad.duracion < duracionMinima) {
			error('''No puede durar menos de «duracionMinima» minutos''', 
					PlanificacionConferenciaPackage.Literals.ACTIVIDAD__DURACION) 
		}
	}
}
