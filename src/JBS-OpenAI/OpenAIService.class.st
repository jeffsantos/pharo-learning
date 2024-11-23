Class {
	#name : #OpenAIService,
	#superclass : #Object,
	#instVars : [
		'urlBase',
		'apiKey'
	],
	#category : #'JBS-OpenAI'
}

{ #category : #'instance creation' }
OpenAIService class >> createWithKey: aString [
	^ self new
				apiKey: aString
]

{ #category : #accessing }
OpenAIService >> apiKey [
	^ apiKey
]

{ #category : #accessing }
OpenAIService >> apiKey: aString [
	apiKey := aString
]

{ #category : #initialization }
OpenAIService >> initialize [ 
	super initialize.
	self urlBase: 'https://api.openai.com/v1/'
]

{ #category : #accessing }
OpenAIService >> models [
	| json endPoint models |
	
	endPoint := 'models'.
	
	json := ZnClient new 
				url: urlBase, endPoint;
				headerAt: 'Authorization' put: 'Bearer ', apiKey;
				get.
				
	models :=  (STON fromString: json) at: 'data'.
	
	^ models collect: [ :each | OAIModel new rawData: each ]
	
]

{ #category : #accessing }
OpenAIService >> prompt: conversation model: modelString [

	| endPoint entityDict entityStr json dict |

	endPoint := 'chat/completions'.
	
	entityDict := {'model' ->  modelString.
				   'messages' -> conversation messages asArray.
				   'temperature' -> 0} asDictionary.
	
	entityStr := NeoJSONWriter toStringPretty:entityDict.
	
	json := ZnClient new
	   		url: self urlBase,endPoint;
	   		headerAt: 'Authorization' put: 'Bearer ', apiKey;
			   entity: (ZnEntity
			               with: entityStr
			               type: ZnMimeType applicationJson);
	   		post.
	
	dict := (STON fromString: json).
	
	^ OAIChatCompletion new rawData: dict.
	
]

{ #category : #accessing }
OpenAIService >> promptGpt35: conversation [
	^ self prompt: conversation model: 'gpt-3.5-turbo'
]

{ #category : #'as yet unclassified' }
OpenAIService >> promptGpt4o: conversation [
	^ self prompt: conversation model: 'chatgpt-4o-latest'
]

{ #category : #accessing }
OpenAIService >> urlBase [
	^ urlBase
]

{ #category : #accessing }
OpenAIService >> urlBase: aString [
	urlBase := aString
]
