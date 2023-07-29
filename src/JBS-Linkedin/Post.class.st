Class {
	#name : #Post,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'JBS-Linkedin'
}

{ #category : #'gt extensions' }
Post >> gtPropertiesFor: aView [
	<gtView>
	^ aView forward
		title: 'Properties';
		priority: 10;
		object: [ rawData ];
		view: #gtItemsFor:
]

{ #category : #accessing }
Post >> rawData [
	^ rawData
]

{ #category : #accessing }
Post >> rawData: aDictionary [
	rawData := aDictionary 
]

{ #category : #accessing }
Post >> text [
	^ ((((rawData at: 'value') at: 'com.linkedin.voyager.feed.render.UpdateV2')
		at: 'commentary') at: 'text') at: 'text'
]

{ #category : #accessing }
Post >> title [
	^ (((((rawData at: 'value') at: 'com.linkedin.voyager.feed.render.UpdateV2')
		at: 'content') at: 'com.linkedin.voyager.feed.render.ArticleComponent')
		at: 'title') at: 'text'
]
