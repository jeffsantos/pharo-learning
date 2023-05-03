Class {
	#name : #OAIChatCompletion,
	#superclass : #OpenAIObject,
	#category : #OpenAI
}

{ #category : #accessing }
OAIChatCompletion >> defaultMessage [
	^ ((self rawData at: 'choices') at: 1) at: 'message' at: 'content'.
]
