Class {
	#name : #WAContactBook,
	#superclass : #SBSComponent,
	#instVars : [
		'contactBook'
	],
	#category : #ContactBook
}

{ #category : #'class initialization' }
WAContactBook class >> initialize [

	"Register the class with its route (url)"

	(WAAdmin register: self asApplicationAt: 'contacts')
		addLibrary: JQDeploymentLibrary;
		addLibrary: SBSDeploymentLibrary
]

{ #category : #accessing }
WAContactBook >> contactBook [

	^ contactBook ifNil: [ contactBook := ContactBook createDefault ]

]

{ #category : #accessing }
WAContactBook >> contactBook: anObject [

	contactBook := anObject
]

{ #category : #accessing }
WAContactBook >> contacts [
	^ self contactBook contacts
]

{ #category : #enumerating }
WAContactBook >> contactsDo: aBlock [
	self contacts do: aBlock
]

{ #category : #rendering }
WAContactBook >> renderContact: aContact on: html [
	html tableRow: [ 
		html 
			tableData: aContact fullname;
			tableData: aContact email;
			tableData: [self renderPhotoOf: aContact on: html]; 
			tableData: [self renderRemoveButtonForContact: aContact on: html] 
			]
]

{ #category : #rendering }
WAContactBook >> renderContactsOn: html [
	html table: [ 
		html tableHead: [ 
			html
				tableHeading: 'Name';
				tableHeading: 'Email';	 
				tableHeading: 'Photo']. 
		self contactsDo: [ :contact | self renderContact: contact on: html ]
		]
]

{ #category : #rendering }
WAContactBook >> renderContentOn: html [

	"Main entry point of the view. Render a title."

	html heading
		level: 1;
		with: 'My Contact Book'.
	self renderContactsOn: html
]

{ #category : #rendering }
WAContactBook >> renderPhotoOf: aContact on: html [
	html imageFluid url: aContact gravatarUrl 
]

{ #category : #rendering }
WAContactBook >> renderRemoveButtonForContact: aContact on: html [
	html formButton  
		beDanger;
		callback: [ self contactBook removeContact: aContact ];
		with: 'Remove'

]

{ #category : #updating }
WAContactBook >> updateRoot: anHtmlRoot [
    super updateRoot: anHtmlRoot.
    anHtmlRoot title: 'Contact Book'
]
