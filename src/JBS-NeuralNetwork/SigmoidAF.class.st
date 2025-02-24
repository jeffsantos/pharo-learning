Class {
	#name : #SigmoidAF,
	#superclass : #ActivationFunction,
	#category : #'JBS-NeuralNetwork'
}

{ #category : #'as yet unclassified' }
SigmoidAF >> derivative: output [
	^ output * (1 - output)
]

{ #category : #'as yet unclassified' }
SigmoidAF >> eval: z [
	^ 1 / (1 + z negated exp )
]
