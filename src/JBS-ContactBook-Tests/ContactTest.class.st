Class {
	#name : #ContactTest,
	#superclass : #TestCase,
	#category : #'JBS-ContactBook-Tests'
}

{ #category : #tests }
ContactTest >> testCreation [
	|contact|
	
	contact := Contact newNamed: 'Jefferson Santos' email: 'jefferson.b.santos@gmail.com'.
	
	self assert: contact fullname equals: 'Jefferson Santos'.
	self assert: contact email equals: 'jefferson.b.santos@gmail.com'.
	
]
