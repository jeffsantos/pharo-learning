Class {
	#name : #TBPostsListComponent,
	#superclass : #TBScreenComponent,
	#instVars : [
		'postComponents',
		'currentCategory'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #hook }
TBPostsListComponent >> children [ 
	^ self postComponents, super children  
]

{ #category : #accessing }
TBPostsListComponent >> currentCategory [

	^ currentCategory
]

{ #category : #accessing }
TBPostsListComponent >> currentCategory: anObject [

	currentCategory := anObject
]

{ #category : #initialization }
TBPostsListComponent >> initialize [ 
	super initialize.
	postComponents := OrderedCollection new
]

{ #category : #initialization }
TBPostsListComponent >> postComponents [
	postComponents := self readSelectedPosts collect: [ :each | 
		TBPostComponent new post: each ].
	^ postComponents 
]

{ #category : #enumerating }
TBPostsListComponent >> readSelectedPosts [ 
 ^ self currentCategory 
	ifNil: [ self blog allVisibleBlogPosts ]
	ifNotNil: [ self blog allVisibleBlogPostsFromCategory: self currentCategory ]
]

{ #category : #rendering }
TBPostsListComponent >> renderContentOn: html [
	super renderContentOn: html.
	html render: (TBCategoriesComponent 
						categories: (self blog allCategories) 
						postsListComponent: self).	
	html container: [ 
		self postComponents do: [ :pc | 
			html render: pc ]
		 ]
]
