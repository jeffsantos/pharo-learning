Class {
	#name : #TBApplicationRootComponent,
	#superclass : #SBSComponent,
	#instVars : [
		'main'
	],
	#category : #'JBS-TinyBlog-Components'
}

{ #category : #initialization }
TBApplicationRootComponent class >> canBeRoot [ 
	^ true
]

{ #category : #initialization }
TBApplicationRootComponent class >> initialize [ 
	"self initialize "
	
	| app | 
	
	app := WAAdmin register: self asApplicationAt: 'TinyBlog'.
   app
		addLibrary: JQDeploymentLibrary;
      addLibrary: JQUiDeploymentLibrary;
      addLibrary: SBSDeploymentLibrary

]

{ #category : #hooks }
TBApplicationRootComponent >> children [
	^ { main }
]

{ #category : #initialization }
TBApplicationRootComponent >> initialize [ 
	super initialize.
	main := TBPostsListComponent new.
]

{ #category : #rendering }
TBApplicationRootComponent >> main: aComponent [
	main := aComponent 
]

{ #category : #rendering }
TBApplicationRootComponent >> renderContentOn: html [
	html render: main
]

{ #category : #updating }
TBApplicationRootComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'Tiny Blog'
]
