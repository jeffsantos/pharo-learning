Class {
	#name : #TBPostsListComponent,
	#superclass : #TBScreenComponent,
	#instVars : [
		'postComponents',
		'currentCategory'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #rendering }
TBPostsListComponent >> categoriesComponent [

	^ TBCategoriesComponent
		  categories: self blog allCategories
		  postsListComponent: self
]

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
TBPostsListComponent >> postComponentFor: aPost [

	^ TBPostComponent new post: aPost
]

{ #category : #initialization }
TBPostsListComponent >> postComponents [

	postComponents := self readSelectedPosts collect: [ :each | 
		                  self postComponentFor: each ].
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
	html container: [ 
		html row with: [ 
			html column
				extraSmallSize: 12;
				smallSize: 2;
				mediumSize: 4;
				with: [ html render: self categoriesComponent ].
			html column
				extraSmallSize: 12;
				smallSize: 10;
				mediumSize: 8;
				with: [ 
					html container: [ 
							self postComponents do: [ :pc | html render: pc ] ] ] ] ]
]
