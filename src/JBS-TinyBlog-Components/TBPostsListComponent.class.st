Class {
	#name : #TBPostsListComponent,
	#superclass : #TBScreenComponent,
	#instVars : [
		'postComponents',
		'currentCategory'
	],
	#category : #'JBS-TinyBlog-Components'
}

{ #category : #rendering }
TBPostsListComponent >> basicRenderCategoriesOn: html [

	html render: self categoriesComponent
]

{ #category : #rendering }
TBPostsListComponent >> basicRenderPostOn: html [

	self postComponents do: [ :pc | html render: pc ]
]

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
TBPostsListComponent >> renderCategoryColumnOn: html [

	html column
		extraSmallSize: 12;
		smallSize: 2;
		mediumSize: 4;
		with: [ self basicRenderCategoriesOn: html ]
]

{ #category : #rendering }
TBPostsListComponent >> renderContentOn: html [

	super renderContentOn: html.
	html container: [ 
		html row with: [ 
			self renderCategoryColumnOn: html.
			self renderPostColumnOn: html ] ]
]

{ #category : #rendering }
TBPostsListComponent >> renderPostColumnOn: html [

	html column
		extraSmallSize: 12;
		smallSize: 10;
		mediumSize: 8;
		with: [ self basicRenderPostOn: html ]
]
