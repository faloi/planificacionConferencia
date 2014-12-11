/*
 * generated by Xtext
 */
package edu.unq.objetos3.validation

import edu.unq.objetos3.planificacionConferencia.Actividad
import edu.unq.objetos3.planificacionConferencia.ActividadAccesoria
import edu.unq.objetos3.planificacionConferencia.Almuerzo
import edu.unq.objetos3.planificacionConferencia.Bloque
import edu.unq.objetos3.planificacionConferencia.Break
import edu.unq.objetos3.planificacionConferencia.Charla
import edu.unq.objetos3.planificacionConferencia.Debate
import edu.unq.objetos3.planificacionConferencia.IntervaloTiempo
import edu.unq.objetos3.planificacionConferencia.Model
import edu.unq.objetos3.planificacionConferencia.PlanificacionConferenciaPackage
import org.eclipse.emf.ecore.EReference
import org.eclipse.xtext.validation.Check

import static extension edu.unq.objetos3.extensions.collections.IterableExtensions.*
import static extension edu.unq.objetos3.extensions.model.ActividadExtensions.*
import static extension edu.unq.objetos3.extensions.model.BloqueExtensions.*
import static extension edu.unq.objetos3.extensions.model.IntervaloTiempoExtensions.*
import static extension edu.unq.objetos3.extensions.model.OradorExtensions.*
import static extension edu.unq.objetos3.extensions.model.ScheduleExtensions.*

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
	def checkActividadesOradorNoSeSolapan(Model model) {
		val oradores = model.actividades.flatMap[oradores]
		oradores.forEach [
			val solapadas = it.actividadesSolapadasEn(model.schedules)
			if (!solapadas.empty) {
				//TODO seria mas interesante que el error este en el schedule, pero me caga de nuevo lo del bloque
				error(
					'''«nombre» tiene actividades que se solapan: «solapadas.map[name].join(", ")»''',
					it,
					PlanificacionConferenciaPackage.Literals.ORADOR__NOMBRE)
			}
		]
	}
	
	@Check
	def checkActividadesAdyacentesPorOrador(Model model) {
		val oradores = model.actividades.flatMap[oradores]
		oradores.forEach [
			val adyacentes = it.actividadesAdyacentesEn(model.schedules)
			if (!adyacentes.empty) {
				//TODO seria mas interesante que el error este en el schedule, pero me caga de nuevo lo del bloque
				warning(
					'''«nombre» tiene actividades adyacentes: «adyacentes.map[name].join(", ")»''',
					it,
					PlanificacionConferenciaPackage.Literals.ORADOR__NOMBRE)
			}
		]
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
			error('''Un bloque no puede durar más de 2 horas, pero dura «bloque.duracion.asString»''', 
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
						Esta actividad espera recibir mas del 90% de la capacidad de «espacio.nombre» (quizás podría reubicarse en un espacio más grande?)
					''', 
					PlanificacionConferenciaPackage.Literals.BLOQUE__ACTIVIDADES,
					bloque.actividades.indexOf(it))				
					
				case capacidadAprovechada < 0.5:				
					warning('''
						Esta actividad espera recibir menos del 50% de la capacidad de «espacio.nombre» (quizás podría reubicarse en un espacio más chico?)
					''', 
					PlanificacionConferenciaPackage.Literals.BLOQUE__ACTIVIDADES,
					bloque.actividades.indexOf(it))									
			}
		]
	}
	
	@Check
	def checkActividadesEstanPlanificadasSoloUnaVez(Model model) {
		model.actividades.forEach [ actividad |
			val vecesPlanificada = model.schedules.sum[cantidadDeVecesPlanificada(actividad)]
			
			if (vecesPlanificada == 0)
				error(
					"Esta actividad no está planificada",
					actividad, 
					PlanificacionConferenciaPackage.Literals.ACTIVIDAD__NAME)
			else if (vecesPlanificada > 1)
				error(
					'''Esta actividad está planificada «vecesPlanificada» veces''',
					actividad, 
					PlanificacionConferenciaPackage.Literals.ACTIVIDAD__NAME)
		]
	}
	
	@Check
	def checkDiversidadDeOrganizacionesEnBloque(Bloque bloque) {
		bloque.actividadesPorOrganizacion.forEach[organizacion, actividades |
			if (actividades.length > 1) {
				actividades.tail.forEach [
					warning(
						'''En este bloque hay más de una actividad de «organizacion»: «actividades.map[name].join(", ")»''',
						PlanificacionConferenciaPackage.Literals.BLOQUE__ACTIVIDADES,
						bloque.actividades.indexOf(it)
					)					
				]
			}
		]
	}			
	
	protected def checkDuracionMinima(ActividadAccesoria actividadAccesoria, IntervaloTiempo duracionMinima) {
		checkDuracionMinima(
			actividadAccesoria.duracion, 
			duracionMinima, 
			PlanificacionConferenciaPackage.Literals.ACTIVIDAD_ACCESORIA__DURACION
		) 
	}	
	
	protected def checkDuracionMinima(Actividad actividad, IntervaloTiempo duracionMinima) {
		checkDuracionMinima(actividad.duracion, duracionMinima, PlanificacionConferenciaPackage.Literals.ACTIVIDAD__DURACION)
	}
	
	protected def checkDuracionMinima(IntervaloTiempo duracion, IntervaloTiempo duracionMinima, EReference reference) {
		if (duracion < duracionMinima)
			error('''No puede durar menos de «duracionMinima.asString»''', reference)
	}
}
