Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'JBS-Dice'
}

{ #category : #'instance creation' }
Die class >> withFaces: anInteger [
	^ self new faces: anInteger
]

{ #category : #accessing }
Die >> faces [
	^ faces
]

{ #category : #accessing }
Die >> faces: anInteger [

	faces := anInteger
]

{ #category : #initialization }
Die >> initialize [
	super initialize.
	faces := 6
]

{ #category : #printing }
Die >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: '(';
      print: faces;
      nextPutAll: ')'
]

{ #category : #action }
Die >> roll [
	^ faces atRandom
]
