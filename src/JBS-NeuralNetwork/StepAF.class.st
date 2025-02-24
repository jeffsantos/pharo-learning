Class {
	#name : #StepAF,
	#superclass : #ActivationFunction,
	#category : #'JBS-NeuralNetwork'
}

{ #category : #'as yet unclassified' }
StepAF >> derivative: output [
	^ 1
]

{ #category : #'as yet unclassified' }
StepAF >> eval: z [  
	^ (z > 0) ifTrue: [ 1 ] ifFalse: [ 0 ]
]
