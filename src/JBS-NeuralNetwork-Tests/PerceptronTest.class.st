Class {
	#name : #PerceptronTest,
	#superclass : #TestCase,
	#category : #'JBS-NeuralNetwork-Tests'
}

{ #category : #'instance creation' }
PerceptronTest >> newNeuron [
	^ Neuron new
]

{ #category : #'instance creation' }
PerceptronTest >> testSmallExample [
	| p result |

	p := self newNeuron. 
	p weights: #(1 2). 
	p bias: -2. 
	result := p feed: #(5 2).
	self assert: result equals: 1 
]
