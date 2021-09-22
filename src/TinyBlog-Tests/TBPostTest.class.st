Class {
	#name : #TBPostTest,
	#superclass : #TestCase,
	#category : #'TinyBlog-Tests'
}

{ #category : #tests }
TBPostTest >> testCreatePostCategoryUnclassified [
	| post | 
	
	post := TBPost title: 'Testing Post' text: 'This is a post just for test'.
	self assert: post title equals: 'Testing Post'.
	self assert: post text equals: 'This is a post just for test'.
	self assert: post isUnclassified.
	self deny: post isVisible 
]

{ #category : #tests }
TBPostTest >> testCreatePostWithCategory [
	| post | 
	
	post := (TBPost title: 'Title' text: 'Text' category: 'Category').
	
	self assert: post title equals: 'Title'.
	self assert: post text equals: 'Text'.
	self assert: post category equals: 'Category'
]

{ #category : #tests }
TBPostTest >> testInitialize [
	| post |
	
	post := TBPost new initialize.
	self assert: post category equals: post class unclassifiedTag.
	self assert: post date equals: Date today.
	self assert: post visible equals: false.
]
