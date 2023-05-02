Class {
	#name : #OpenAIObject,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #OpenAI
}

{ #category : #accessing }
OpenAIObject >> rawData [
	^ rawData
]

{ #category : #accessing }
OpenAIObject >> rawData: dict [
	rawData := dict 
]
