package edu.unq.objetos3.extensions.collections

import java.util.Set

class SetExtensions {
	static def <T> intersection(Set<T> one, Set<T> another) {
		one.filter[another.contains(it)]
	}	
}