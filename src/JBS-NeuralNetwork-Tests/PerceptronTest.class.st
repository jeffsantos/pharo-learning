Class {
	#name : #PerceptronTest,
	#superclass : #TestCase,
	#category : #'JBS-NeuralNetwork-Tests'
}

{ #category : #'private - creation' }
PerceptronTest >> createDigitalComparator: inputs [
	| not and nor a b aGb aEb aLb notA notB |
	
	a := inputs first.
	b := inputs second.
	and := Perceptron new
		       weights: #( 1 1 );
		       bias: -1.5.
	not := Perceptron new
		       weights: #( -1 );
		       bias: 0.5.
	nor := Perceptron new
		       weights: #( -1 -1 );
		       bias: 0.5.
		
	notA := not feed: { a }.
	notB := not feed: { b }.
	aLb := and feed: { notA . b }.
	aGb := and feed: { a . notB }.
	aEb := nor feed: { aGb . aLb }.
	
	^ { aGb . aEb . aLb }
]

{ #category : #tests }
PerceptronTest >> testDigitalComparator [
	self assert: (self createDigitalComparator: #( 0 0 )) equals: #( 0 1 0 ).
	self assert: (self createDigitalComparator: #( 0 1 )) equals: #( 0 0 1 ).
	self assert: (self createDigitalComparator: #( 1 0 )) equals: #( 1 0 0 ).
	self assert: (self createDigitalComparator: #( 1 1 )) equals: #( 0 1 0 ).
]

{ #category : #tests }
PerceptronTest >> testWrongFeeding [

	| p |
	p := Perceptron new.
	p weights: #( -1 ).
	p bias: 0.5.
	self should: [ p feed: #( 1 1 ) ] raise: Error
]
