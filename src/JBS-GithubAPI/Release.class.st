Class {
	#name : #Release,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'JBS-GithubAPI'
}

{ #category : #'gt extensions' }
Release >> gtPropertiesFor: aView [
	<gtView>
	^ aView forward
		title: 'Properties';
		priority: 10;
		object: [ rawData ];
		view: #gtItemsFor:
]

{ #category : #accessing }
Release >> rawData [
	^ rawData
]

{ #category : #accessing }
Release >> rawData: aDictionary [
	rawData := aDictionary 
]
