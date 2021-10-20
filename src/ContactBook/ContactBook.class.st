Class {
	#name : #ContactBook,
	#superclass : #Object,
	#instVars : [
		'contacts'
	],
	#category : #ContactBook
}

{ #category : #action }
ContactBook >> addContact: aContact [
	self contacts add: aContact
]

{ #category : #accessing }
ContactBook >> contacts [
	^ contacts ifNil: [ contacts := OrderedCollection new ]
]

{ #category : #size }
ContactBook >> numberOfContacts [
	^ contacts size
]

{ #category : #action }
ContactBook >> removeContact: aContact [
	self contacts remove: aContact
]
