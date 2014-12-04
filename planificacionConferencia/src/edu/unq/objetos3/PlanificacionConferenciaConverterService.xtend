package edu.unq.objetos3

import org.eclipse.xtext.conversion.IValueConverter
import org.eclipse.xtext.conversion.ValueConverter
import org.eclipse.xtext.conversion.impl.AbstractDeclarativeValueConverterService
import org.eclipse.xtext.conversion.ValueConverterException
import org.eclipse.xtext.nodemodel.INode

class PlanificacionConferenciaConverterService extends AbstractDeclarativeValueConverterService {
	@ValueConverter(rule="NOMBRE_ESPACIO")
	def getNombreEspacioConverter() {
		new IValueConverter<String> {
			override toString(String value) throws ValueConverterException {
				'''* «value» ~'''
			}

			override toValue(String string, INode node) throws ValueConverterException {
				string.replace('*', '').replace('~', '').trim
			}
		}
	}
	
	@ValueConverter(rule="NOMBRE_TRACK")
	def getNombreTrackConverter() {
		new IValueConverter<String> {
			override toString(String value) throws ValueConverterException {
				'''(«value»)'''
			}

			override toValue(String string, INode node) throws ValueConverterException {
				string.replace('(', '').replace(')', '').trim
			}
		}
	}	
}

