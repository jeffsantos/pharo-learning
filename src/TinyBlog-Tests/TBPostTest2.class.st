Class {
	#name : #TBPostTest2,
	#superclass : #TestCase,
	#category : #'TinyBlog-Tests'
}

{ #category : #tests }
TBPostTest2 >> testInitialize [
	| post |
	
	post := TBPost new initialize.
	self assert: post category equals: post class unclassifiedTag.
	self assert: post date equals: Date today.
	self assert: post visible equals: false.
]
