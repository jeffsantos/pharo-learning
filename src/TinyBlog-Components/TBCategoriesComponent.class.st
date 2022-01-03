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
		postsListComponent: aTBScreenComponent
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
TBCategoriesComponent >> postsListComponent [
	^ postsListComponent 
]

{ #category : #accessing }
TBCategoriesComponent >> postsListComponent: aComponent [
	postsListComponent := aComponent 
]

{ #category : #rendering }
TBCategoriesComponent >> renderCategoryLinkOn: html with: aCategory [

	html listGroupLinkedItem
		class: 'active' if: aCategory = self postsListComponent currentCategory;
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
