package edu.unq.objetos3.extensions.collections

import org.eclipse.xtext.xbase.lib.Functions.Function1

class IterableExtensions {
	static def <T> except(Iterable<T> iterable, T element) {
		iterable.filter[it != element]
	}
	
	static def <T, R> flatMap(Iterable<T> iterable, Function1<? super T, ? extends Iterable<R>> transformation) {
		iterable.map(transformation).flatten
	}	
}