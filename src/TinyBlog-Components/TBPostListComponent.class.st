Class {
	#name : #TBPostListComponent,
	#superclass : #TBScreenComponent,
	#instVars : [
		'postComponents'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #hook }
TBPostListComponent >> children [ 
	^ self postComponents, super children  
]

{ #category : #initialization }
TBPostListComponent >> initialize [ 
	super initialize.
	postComponents := OrderedCollection new
]

{ #category : #initialization }
TBPostListComponent >> postComponents [
	postComponents := self readSelectedPosts collect: [ :each | 
		TBPostComponent new post: each ].
	^ postComponents 
]

{ #category : #enumerating }
TBPostListComponent >> readSelectedPosts [ 
 ^ self blog allVisibleBlogPosts
]

{ #category : #rendering }
TBPostListComponent >> renderContentOn: html [
	super renderContentOn: html.
	html container: [ 
		self postComponents do: [ :pc | 
			html render: pc ]
		 ]
]
