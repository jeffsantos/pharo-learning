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
	#category : #ContactBook
}

{ #category : #'instance initialization' }
Contact class >> default [
	^ self new
		addContact: (self class
							newNamed: 'Damien Cassou'
							email: 'damien@cassou.me');
		addContact: (self class
							newNamed: 'Marcus Denker'
							email: 'marcus.denker@inria.fr');
		addContact: (self class
							newNamed: 'Tudor Girba'
							email: 'tudor@tudorgirba.com');
		addContact: (self class
							newNamed: 'Clara Allende'
							email: 'clari.allende@gmail.com');
		yourself

]

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
