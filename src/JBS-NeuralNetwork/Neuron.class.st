Class {
	#name : #Neuron,
	#superclass : #Object,
	#instVars : [
		'weights',
		'bias',
		'learningRate'
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
	^ z > 0
		  ifTrue: [ 1 ]
		  ifFalse: [ 0 ]
]

{ #category : #views }
Neuron >> gtBiasFor: aView [
	<gtView>
	^ aView forward
		title: 'Bias';
		object: [ self bias ];
		view: #gtPreviewFor:
]

{ #category : #views }
Neuron >> gtWeightsFor: aView [
	<gtView>
	^ aView forward
		title: 'Weights';
		object: [ self weights ];
		view: #gtItemsFor:
]

{ #category : #initialization }
Neuron >> initialize [ 
	super initialize. 
	learningRate := 0.1
]

{ #category : #accessing }
Neuron >> learningRate [

	^ learningRate
]

{ #category : #accessing }
Neuron >> learningRate: aLearningRateAsFloat [

	learningRate := aLearningRateAsFloat
]

{ #category : #computation }
Neuron >> train: inputs desiredOutput: desiredOutput [
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
Neuron >> weights [
	
	^ weights 
]

{ #category : #accessing }
Neuron >> weights: someWeightsAsNumbers [
	"Set the weights of the neuron. 
	Takes a collection of numbers as argument." 

	weights := someWeightsAsNumbers asOrderedCollection 
]
