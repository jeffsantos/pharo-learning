Class {
	#name : #OAIChatCompletion,
	#superclass : #OpenAIObject,
	#category : #'JBS-OpenAI'
}

{ #category : #accessing }
OAIChatCompletion >> response [
	^ ((self rawData at: 'choices') at: 1) at: 'message' at: 'content'.
]
