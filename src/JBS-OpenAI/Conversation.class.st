Class {
	#name : #Conversation,
	#superclass : #Object,
	#instVars : [
		'messages'
	],
	#category : #'JBS-OpenAI'
}

{ #category : #adding }
Conversation >> addAssistantMessage: messageString [
	self addMessage: messageString role: 'assistant'
]

{ #category : #adding }
Conversation >> addMessage: messageString role: roleString [
	| message |
	
	message := { 'role' -> roleString.
					 'content' -> messageString} asDictionary. 
					
	self messages add: message. 
]

{ #category : #adding }
Conversation >> addSystemMessage: messageString [
	self addMessage: messageString role: 'system'
]

{ #category : #adding }
Conversation >> addUserMessage: messageString [
	self addMessage: messageString role: 'user'
]

{ #category : #accessing }
Conversation >> lastMessage [ 
	 ^ self messages isEmpty 
			ifTrue: [ '' ]
			ifFalse: [ self messages last at: 'content' ].	
]

{ #category : #accessing }
Conversation >> messages [ 
	^ messages ifNil: [ messages := OrderedCollection new ]
	
]
