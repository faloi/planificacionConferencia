package edu.unq.objetos3.extensions.collections

class IterableExtensions {
	static def <T> except(Iterable<T> iterable, T element) {
		iterable.filter[it != element]
	}
	
	static def <T, R> flatMap(Iterable<T> iterable, (T) => Iterable<R> transformation) {
		iterable.map(transformation).flatten
	}	
	
	static def <T> sum(Iterable<T> iterable, (T) => int transformation) {
		iterable.map(transformation).fold(0) [ acum, elem | acum + elem ]
	}		
}