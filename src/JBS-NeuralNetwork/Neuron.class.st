Class {
	#name : #Neuron,
	#superclass : #Object,
	#instVars : [
		'weights',
		'bias'
	],
	#category : #'JBS-NeuralNetwork'
}

{ #category : #accessing }
Neuron >> bias [

	^ bias
]

{ #category : #accessing }
Neuron >> bias: aNumber [

	bias := aNumber
]

{ #category : #computation }
Neuron >> feed: inputs [
	| z |
	z := (inputs with: weights collect: [ :x :w | x * w ]) sum + bias.
	^ z > 0 ifTrue: [ 1 ] ifFalse: [ 0 ]
]

{ #category : #accessing }
Neuron >> weights [
	
	^ weights 
]

{ #category : #accessing }
Neuron >> weights: someWeightsAsNumbers [
	"Set the weights of the neuron. 
	Takes a collection of numbers as argument." 

	weights := someWeightsAsNumbers
]
