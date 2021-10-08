Class {
	#name : #DieHandle,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #Dice
}

{ #category : #arithmetic }
DieHandle >> + aDieHandle [
	| newHandle |
	newHandle := self class new.
	newHandle dice addAll: (self dice).
	newHandle dice addAll: (aDieHandle dice).	
	^ newHandle
]

{ #category : #adding }
DieHandle >> addDie: aDie [ 
	dice add: aDie 
]

{ #category : #accessing }
DieHandle >> dice [
	^ dice
]

{ #category : #accessing }
DieHandle >> dice: aDice [

	dice := aDice
]

{ #category : #'as yet unclassified' }
DieHandle >> diceNumber [
	^ dice size
]

{ #category : #initialization }
DieHandle >> initialize [
	super initialize. 
	dice := OrderedCollection new
]

{ #category : #'as yet unclassified' }
DieHandle >> maxValue [
	| res |	
	res := 0.
	dice do: [:each | res := res + each faces].
	^ res 
]

{ #category : #action }
DieHandle >> roll [
	| res |	
	res := 0.
	dice do: [:each | res := res + each roll].
	^ res
]
