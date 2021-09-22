Class {
	#name : #TBPostTest,
	#superclass : #TestCase,
	#category : #'TinyBlog-Tests'
}

{ #category : #tests }
TBPostTest >> testInitialize [
	| post |
	
	post := TBPost new initialize.
	self assert: post category equals: post class unclassifiedTag.
	self assert: post date equals: Date today.
	self assert: post visible equals: false.
]
