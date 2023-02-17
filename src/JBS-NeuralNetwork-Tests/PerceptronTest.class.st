Class {
	#name : #PerceptronTest,
	#superclass : #TestCase,
	#category : #'JBS-NeuralNetwork-Tests'
}

{ #category : #tests }
PerceptronTest >> digitalComparator: inputs [

	"Return an array of three elements"

	| not and nor a b aGb aEb aLb notA notB |
	
	a := inputs first.
	b := inputs second.
	and := self newNeuron
		       weights: #( 1 1 );
		       bias: -1.5.
	not := self newNeuron
		       weights: #( -1 );
		       bias: 0.5.
	nor := self newNeuron
		       weights: #( -1 -1 );
		       bias: 0.5.
		
	notA := not feed: { a }.
	notB := not feed: { b }.
	aLb := and feed: { notA . b }.
	aGb := and feed: { a . notB }.
	aEb := nor feed: { aGb . aLb }.
	
	^ { aGb . aEb . aLb }
]

{ #category : #'instance creation' }
PerceptronTest >> newNeuron [
	^ Neuron new
]

{ #category : #tests }
PerceptronTest >> testAND [

	| p |
	p := self newNeuron.
	p weights: #( 1 1 ).
	p bias: -1.5.
	self assert: (p feed: #( 0 0 )) equals: 0.
	self assert: (p feed: #( 0 1 )) equals: 0.
	self assert: (p feed: #( 1 0 )) equals: 0.
	self assert: (p feed: #( 1 1 )) equals: 1
]

{ #category : #tests }
PerceptronTest >> testDigitalComparator [

	self assert: (self digitalComparator: #( 0 0 )) equals: #( 0 1 0 ).
	self assert: (self digitalComparator: #( 0 1 )) equals: #( 0 0 1 ).
	self assert: (self digitalComparator: #( 1 0 )) equals: #( 1 0 0 ).
	self assert: (self digitalComparator: #( 1 1 )) equals: #( 0 1 0 )
]

{ #category : #tests }
PerceptronTest >> testNOR [

	| p |
	p := self newNeuron.
	p weights: #( -1 -1 ).
	p bias: 0.5.
	self assert: (p feed: #( 0 0 )) equals: 1.
	self assert: (p feed: #( 0 1 )) equals: 0.
	self assert: (p feed: #( 1 0 )) equals: 0.
	self assert: (p feed: #( 1 1 )) equals: 0
]

{ #category : #tests }
PerceptronTest >> testNOT [

	| p |
	p := self newNeuron.
	p weights: #( -1 ).
	p bias: 0.5.
	self assert: (p feed: #( 1 )) equals: 0.
	self assert: (p feed: #( 0 )) equals: 1
]

{ #category : #tests }
PerceptronTest >> testOR [

	| p |
	p := self newNeuron.
	p weights: #( 1 1 ).
	p bias: -0.5.
	self assert: (p feed: #( 0 0 )) equals: 0.
	self assert: (p feed: #( 0 1 )) equals: 1.
	self assert: (p feed: #( 1 0 )) equals: 1.
	self assert: (p feed: #( 1 1 )) equals: 1
]

{ #category : #tests }
PerceptronTest >> testSmallExample [

	| p result |
	p := self newNeuron.
	p weights: #( 1 2 ).
	p bias: -2.
	result := p feed: #( 5 2 ).
	self assert: result equals: 1
]

{ #category : #tests }
PerceptronTest >> testTrainingNOT [

	| p |
	p := self newNeuron.
	p weights: #( -1 ).
	p bias: 2.
	40 timesRepeat: [ 
		p train: #( 0 ) desiredOutput: 1.
		p train: #( 1 ) desiredOutput: 0 ].
	
	self assert: (p feed: #( 0 )) equals: 1.
	self assert: (p feed: #( 1 )) equals: 0
]

{ #category : #tests }
PerceptronTest >> testTrainingOR [

	| p |
	p := self newNeuron.
	p weights: #( -1 -1 ).
	p bias: 2.
	40 timesRepeat: [ 
		p train: #( 0 0 ) desiredOutput: 0.
		p train: #( 0 1 ) desiredOutput: 1.
		p train: #( 1 0 ) desiredOutput: 1.
		p train: #( 1 1 ) desiredOutput: 1 ].

	self assert: (p feed: #( 0 0 )) equals: 0.
	self assert: (p feed: #( 0 1 )) equals: 1.
	self assert: (p feed: #( 1 0 )) equals: 1.
	self assert: (p feed: #( 1 1 )) equals: 1
]

{ #category : #tests }
PerceptronTest >> testWrongFeeding [

	| p |
	p := self newNeuron.
	p weights: #( -1 ).
	p bias: 0.5.
	self should: [ p feed: #( 1 1 ) ] raise: Error
]
