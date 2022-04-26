Class {
	#name : #SBSContactBook,
	#superclass : #SBSComponent,
	#instVars : [
		'contactBook'
	],
	#category : #'JBS-ContactBook'
}

{ #category : #'class initialization' }
SBSContactBook class >> initialize [

	"Register the class with its route (url)"

	(WAAdmin register: self asApplicationAt: 'contacts')
		addLibrary: JQDeploymentLibrary;
		addLibrary: SBSDeploymentLibrary
]

{ #category : #adding }
SBSContactBook >> addContact [
	(self call: SBSContact new)
		ifNotNil: [ :contact | contactBook addContact: contact ]
]

{ #category : #accessing }
SBSContactBook >> contactBook [

	^ contactBook ifNil: [ contactBook := ContactBook createDefault ]

]

{ #category : #accessing }
SBSContactBook >> contactBook: anObject [

	contactBook := anObject
]

{ #category : #accessing }
SBSContactBook >> contacts [
	^ self contactBook contacts
]

{ #category : #enumerating }
SBSContactBook >> contactsDo: aBlock [
	self contacts do: aBlock
]

{ #category : #rendering }
SBSContactBook >> renderButtonsForContact: aContact on: html [
	html buttonGroup: [ 
		self
			renderEditButtonForContact: aContact on: html;		
			renderRemoveButtonForContact: aContact on: html ]

]

{ #category : #rendering }
SBSContactBook >> renderContact: aContact on: html [

	html tableRow: [ 
		html
			tableData: aContact fullname;
			tableData: aContact email;
			tableData: [ self renderPhotoOf: aContact on: html ];
			tableData: [ self renderButtonsForContact: aContact on: html ] ]
]

{ #category : #rendering }
SBSContactBook >> renderContactsOn: html [
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
SBSContactBook >> renderContentOn: html [

	"Main entry point of the view. Render a title."

	html heading
		level: 1;
		with: 'My Contact Book'.
	html form: [ 
		self renderContactsOn: html.
		self renderGlobalButtonsOn: html ]
]

{ #category : #rendering }
SBSContactBook >> renderEditButtonForContact: aContact on: html [
	html formButton 
		beSuccess;
		callback: [ self call: (SBSContact editContact: aContact) ];
		with: 'Edit'
]

{ #category : #rendering }
SBSContactBook >> renderGlobalButtonsOn: html [
	html formButton 
		beSuccess;
		callback: [ self addContact ];
		with: 'New Contact'
]

{ #category : #rendering }
SBSContactBook >> renderPhotoOf: aContact on: html [
	html imageFluid url: aContact gravatarUrl 
]

{ #category : #rendering }
SBSContactBook >> renderRemoveButtonForContact: aContact on: html [
	html formButton  
		beDanger;
		callback: [ self contactBook removeContact: aContact ];
		with: 'Remove'

]

{ #category : #updating }
SBSContactBook >> updateRoot: anHtmlRoot [
    super updateRoot: anHtmlRoot.
    anHtmlRoot title: 'Contact Book'
]
