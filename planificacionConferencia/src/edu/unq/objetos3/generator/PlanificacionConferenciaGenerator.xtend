/*
 * generated by Xtext
 */
package edu.unq.objetos3.generator

import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.IGenerator
import org.eclipse.xtext.generator.IFileSystemAccess
import edu.unq.objetos3.planificacionConferencia.Schedule

import static extension edu.unq.objetos3.extensions.model.FechaExtensions.*
import edu.unq.objetos3.planificacionConferencia.Espacio
import edu.unq.objetos3.planificacionConferencia.ActividadAccesoria
import edu.unq.objetos3.planificacionConferencia.Actividad
import edu.unq.objetos3.planificacionConferencia.Bloque

/**
 * Generates code from your model files on save.
 * 
 * see http://www.eclipse.org/Xtext/documentation.html#TutorialCodeGeneration
 */
class PlanificacionConferenciaGenerator implements IGenerator {

	override void doGenerate(Resource resource, IFileSystemAccess fsa) {
		fsa.generateFile("index.jade", '''
			doctype html
			html(lang="en")
				head
					title="WISIT 14"
					link(rel="stylesheet", href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css")
					
				body
					«compile(resource)»
		''')
	}

	def compile(Resource resource) '''
		body
			.container
				h1 Actividades WISIT 14
				«FOR schedule : resource.allContents.filter(Schedule).toList»
					«compile(schedule)»
				«ENDFOR»
	'''

	def compile(Schedule schedule) '''
		h2 «schedule.fecha.diaDeSemana»
			small «schedule.fecha.asString»
			
		«FOR espacio : schedule.espacios»
			«compile(espacio)»
		«ENDFOR»			
	'''
	
	def compile(Espacio espacio) '''
		h3 «espacio.nombre»
		table.table.table-hover
			tbody
				«FOR actividad : espacio.actividades»
					«compileActividad(actividad)»
				«ENDFOR»				
	'''
	
	def dispatch compileActividad(ActividadAccesoria actividad) '''
		tr.success
			td
			td «actividad.class.interfaces.get(0).simpleName»	
	'''
	
	def dispatch compileActividad(Bloque bloque) '''
		«FOR actividad : bloque.actividades»
			«actividad.compile(bloque)»
		«ENDFOR»	
	'''
	
	def compile(Actividad actividad, Bloque bloque) '''
		tr
			«IF bloque.actividades.indexOf(actividad) == 0»
				td(rowspan="«bloque.actividades.length»") «actividad.track»
			«ENDIF»
			td 
				strong «actividad.titulo»
				«FOR orador : actividad.oradores»
					p @«orador.nombre» - «orador.organizacion»
				«ENDFOR»	
	'''	
}
