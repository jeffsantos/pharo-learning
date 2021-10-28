Class {
	#name : #SBSContact,
	#superclass : #SBSComponent,
	#instVars : [
		'contact'
	],
	#category : #ContactBook
}

{ #category : #'as yet unclassified' }
SBSContact class >> editContact: aContact [
	^ self new
		setContact: aContact;
		yourself
]

{ #category : #accessing }
SBSContact >> contact [
	^ contact
]

{ #category : #initialization }
SBSContact >> initialize [ 
	super initialize.
	contact := Contact new.
]

{ #category : #rendering }
SBSContact >> renderButtonsOn: html [
	html formGroup: [ 
		self
			renderSubmitButtonOn: html;
			renderCancelButtonOn: html ]
]

{ #category : #rendering }
SBSContact >> renderCancelButtonOn: html [
	html formButton  
		beDanger;
		cancelCallback: [ self answer: nil ];
		with: 'Cancel'
]

{ #category : #rendering }
SBSContact >> renderContentOn: html [
	html heading with: 'Contact Editing'.
	html form with: [ 
		self renderFieldsOn: html. 
		self renderButtonsOn: html ]
]

{ #category : #rendering }
SBSContact >> renderEmailFieldOn: html [

	html formGroup: [ 
		html label: 'Email'.
		html emailInput
			formControl;
			placeholder: 'your@email.eu';
			callback: [ :value | self contact email: value ];
			value: (self contact email ifNil: '') ]
]

{ #category : #rendering }
SBSContact >> renderFieldsOn: html [
	self renderFullNameFieldOn: html.
	self renderEmailFieldOn: html.
]

{ #category : #rendering }
SBSContact >> renderFullNameFieldOn: html [

	html formGroup: [ 
		html label: 'Fullname'.
		html textInput
			formControl;
			placeholder: 'fullname';
			callback: [ :value | self contact fullname: value ];
			value: (self contact fullname ifNil: '') ]
]

{ #category : #rendering }
SBSContact >> renderSubmitButtonOn: html [
	html formButton 
		beSuccess;
		bePrimary;
		callback: [ self answer: self contact ];
		with: 'Save'
]

{ #category : #accessing }
SBSContact >> setContact: aContact [
	contact := aContact
]
