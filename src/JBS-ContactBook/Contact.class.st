"
I represent a person with a name and an email address. I'm usually
part of a contact book.

"
Class {
	#name : #Contact,
	#superclass : #Object,
	#instVars : [
		'fullname',
		'email'
	],
	#category : #'JBS-ContactBook'
}

{ #category : #'instance creation' }
Contact class >> newNamed: aNameString email: anEmailString [
	^ self new
		fullname: aNameString;
		email: anEmailString;
		yourself.
]

{ #category : #accessing }
Contact >> email [

	^ email
]

{ #category : #accessing }
Contact >> email: anObject [

	email := anObject
]

{ #category : #accessing }
Contact >> fullname [

	^ fullname
]

{ #category : #accessing }
Contact >> fullname: anObject [

	fullname := anObject
]

{ #category : #'as yet unclassified' }
Contact >> gravatarUrl [
	^ 'http://www.gravatar.com/avatar/', (MD5 hashMessage: email asString trimBoth asLowercase) hex, '.jpg'
]

{ #category : #printing }
Contact >> printOn: aStream [
	super printOn: aStream.	
	aStream
		nextPutAll: ' (';	
		nextPutAll: self fullname;
		nextPutAll: ' <';
		nextPutAll: self email;
		nextPutAll: '>)'
	
]
