Class {
	#name : #OpenAIObject,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'JBS-OpenAI'
}

{ #category : #accessing }
OpenAIObject >> gtPropertiesFor: aView [
	<gtView>
	^ aView forward
		title: 'Properties';
		priority: 10;
		object: [ rawData ];
		view: #gtItemsFor:
]

{ #category : #accessing }
OpenAIObject >> rawData [
	^ rawData
]

{ #category : #accessing }
OpenAIObject >> rawData: dict [
	rawData := dict 
]
