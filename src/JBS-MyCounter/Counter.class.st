"
Counter is a simple concrete class which supports incrementing and
decrementing a counter.
Its API is
- decrement, increment
- count
Its creation API is message startingAt:

"
Class {
	#name : #Counter,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#category : #'JBS-MyCounter'
}

{ #category : #accessing }
Counter class >> startingAt: anInteger [
	"Class method to create a counter with a initial value"
	
	^ self new count: anInteger 
]

{ #category : #accessing }
Counter >> count [
	"Accessor method to the instance variable count"
	
	^ count
]

{ #category : #accessing }
Counter >> count: anInteger [
	"Setter method for the count instance variable"
			
	count := anInteger
]

{ #category : #operations }
Counter >> decrement [
	"Decrement the instance variable count"
		
	count := count - 1
]

{ #category : #operations }
Counter >> increment [
	"Increment the instance variable count"
		
	count := count + 1
]

{ #category : #initialization }
Counter >> initialize [ 
	"Initialize the Counter object as 0"
	
	count := 0
]

{ #category : #printing }
Counter >> printOn: aStream [
	"Human-read information about the instance"
	
	super printOn: aStream.
	aStream nextPutAll: ' with value: ', count printString. 
]
