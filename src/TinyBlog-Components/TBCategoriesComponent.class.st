Class {
	#name : #TBCategoriesComponent,
	#superclass : #SBSComponent,
	#instVars : [
		'categories',
		'postsListComponent'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'class initialization' }
TBCategoriesComponent class >> categories: categories postsListComponent: aTBScreenComponent [
	^ self new 
		categories: categories;
		postsList: aTBScreenComponent
]

{ #category : #accessing }
TBCategoriesComponent >> categories [
	^ categories 
]

{ #category : #accessing }
TBCategoriesComponent >> categories: aCollection [
	categories := aCollection asSortedCollection 
]

{ #category : #accessing }
TBCategoriesComponent >> postsList [
	^ postsListComponent 
]

{ #category : #accessing }
TBCategoriesComponent >> postsList: aComponent [
	postsListComponent := aComponent 
]

{ #category : #rendering }
TBCategoriesComponent >> renderCategoryLinkOn: html with: aCategory [

	html listGroupLinkedItem
		callback: [ self selectCategory: aCategory ];
		with: aCategory
]

{ #category : #rendering }
TBCategoriesComponent >> renderContentOn: html [

	html listGroup: [ 
		html listGroupItem with: [ html strong: 'Categories' ].
		categories do: [ :cat | self renderCategoryLinkOn: html with: cat ] ]
]

{ #category : #actions }
TBCategoriesComponent >> selectCategory: aCategory [
	postsListComponent currentCategory: aCategory 
]
