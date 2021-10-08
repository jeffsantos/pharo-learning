Extension { #name : #Integer }

{ #category : #'*Dice' }
Integer >> D20 [
	| handle |
	handle := DieHandle new.
	self timesRepeat:
		[ handle 	addDie: (Die withFaces: 20) ].
   	^ handle
]
