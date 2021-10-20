Class {
	#name : #ContactBookTest,
	#superclass : #TestCase,
	#category : #'ContactBook-Tests'
}

{ #category : #tests }
ContactBookTest >> testAddContact [
	| book contact1 contact2 |
	book := ContactBook new.
	
	contact1 := Contact newNamed: 'Jefferson Santos' email: 'jefferson.b.santos@gmail.com'.
	contact2 := Contact newNamed: 'Lara Santos' email: 'tilaria@gmail.com'.
	
	book addContact: contact1.
	book addContact: contact2.
	
	self assert: book numberOfContacts equals: 2
]

{ #category : #tests }
ContactBookTest >> testRemoveContact [
	| book contact1 contact2 |
	book := ContactBook new.
	
	contact1 := Contact newNamed: 'Jefferson Santos' email: 'jefferson.b.santos@gmail.com'.
	contact2 := Contact newNamed: 'Lara Santos' email: 'tilaria@gmail.com'.
	
	book addContact: contact1.
	book addContact: contact2.
	self assert: book numberOfContacts equals: 2.
	
	book removeContact: contact1.
	self assert: book numberOfContacts equals: 1.
	
	book removeContact: contact2.	
	self assert: book numberOfContacts equals: 0.
]
