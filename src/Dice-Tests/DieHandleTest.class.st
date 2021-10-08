Class {
	#name : #DieHandleTest,
	#superclass : #TestCase,
	#category : #'Dice-Tests'
}

{ #category : #tests }
DieHandleTest >> testAddingTwiceTheSameDice [	
	| handle |
    
	handle := DieHandle new.
   handle addDie: (Die withFaces: 6).
	self assert: handle diceNumber equals: 1.
            
   handle addDie: (Die withFaces: 6).
	self assert: handle diceNumber equals: 2.

]

{ #category : #tests }
DieHandleTest >> testCreationAndAdding [
	| handle |    
	handle := DieHandle new 
		addDie: (Die withFaces: 6);
      addDie: (Die withFaces: 10);
      yourself.
	self assert: handle diceNumber equals: 2.
		
]

{ #category : #tests }
DieHandleTest >> testMaxValue [
	| handle |    
	handle := DieHandle new 
		addDie: (Die withFaces: 6);
      addDie: (Die withFaces: 10);
      yourself.
	self assert: handle maxValue equals: 16.
		
]

{ #category : #tests }
DieHandleTest >> testRoll [
	| handle |    
	handle := DieHandle new 
		addDie: (Die withFaces: 6);
      addDie: (Die withFaces: 10);
      yourself.
	10 timesRepeat: 
		[ self assert: (handle roll between: handle diceNumber and: handle maxValue ) ]
	
]

{ #category : #tests }
DieHandleTest >> testSimpleHandle [
	self assert: 2 D20 diceNumber equals: 2.

]

{ #category : #tests }
DieHandleTest >> testSumOfHandles [
	| h1 h2 h3 |
	h1 := DieHandle new
				addDie: (Die withFaces: 20);
				addDie: (Die withFaces: 20); yourself. 
	h2 := DieHandle new
				addDie: (Die withFaces: 10);
				addDie: (Die withFaces: 10); yourself. 
	h3 := h1 + h2.
	self assert: h3 diceNumber equals: 4
]

{ #category : #tests }
DieHandleTest >> testSumming [
	| handle |
	handle := 2 D20 + 3 D10.
	self assert: handle diceNumber equals: 5.
]
