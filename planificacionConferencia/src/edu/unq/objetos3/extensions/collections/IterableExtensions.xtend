package edu.unq.objetos3.extensions.collections

class IterableExtensions {
	static def <T> except(Iterable<T> iterable, T element) {
		iterable.filter[it != element]
	}	
}