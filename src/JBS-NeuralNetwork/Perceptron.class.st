Class {
	#name : #Perceptron,
	#superclass : #Object,
	#instVars : [
		'weights',
		'bias',
		'learningRate'
	],
	#category : #'JBS-NeuralNetwork'
}

{ #category : #accessing }
Perceptron >> bias [

	^ bias
]

{ #category : #accessing }
Perceptron >> bias: aNumber [

	bias := aNumber
]

{ #category : #computation }
Perceptron >> feed: inputs [

	| z |
	z := (inputs with: weights collect: [ :x :w | x * w ]) sum + bias.
	^ z > 0
		  ifTrue: [ 1 ]
		  ifFalse: [ 0 ]
]

{ #category : #views }
Perceptron >> gtBiasFor: aView [
	<gtView>
	^ aView forward
		title: 'Bias';
		object: [ self bias ];
		view: #gtPreviewFor:
]

{ #category : #views }
Perceptron >> gtWeightsFor: aView [
	<gtView>
	^ aView forward
		title: 'Weights';
		object: [ self weights ];
		view: #gtItemsFor:
]

{ #category : #initialization }
Perceptron >> initialize [ 
	super initialize. 
	learningRate := 0.1
]

{ #category : #accessing }
Perceptron >> learningRate [

	^ learningRate
]

{ #category : #accessing }
Perceptron >> learningRate: aLearningRateAsFloat [

	learningRate := aLearningRateAsFloat
]

{ #category : #computation }
Perceptron >> train: inputs desiredOutput: desiredOutput [
	| theError output newWeight |
	
	output := self feed: inputs.
	theError := desiredOutput - output.
	inputs withIndexDo: [ :anInput :index | 
							newWeight := ((weights at: index)
		             						+ (learningRate * theError * anInput)) round:2.
							weights at: index put: newWeight ].
						
	bias := (bias + (learningRate * theError)) round:2
]

{ #category : #accessing }
Perceptron >> weights [
	
	^ weights 
]

{ #category : #accessing }
Perceptron >> weights: someWeightsAsNumbers [
	"Set the weights of the neuron. 
	Takes a collection of numbers as argument." 

	weights := someWeightsAsNumbers asOrderedCollection 
]
