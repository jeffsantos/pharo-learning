Class {
	#name : #OpenAIService,
	#superclass : #Object,
	#instVars : [
		'urlBase',
		'apiKey'
	],
	#category : #OpenAI
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
OpenAIService >> prompt: promptString model: modelString [

	| endPoint message messages entityDict entityStr json choices dict |

	endPoint := 'chat/completions'.
	
	message := {'role' -> 'user'.
				   'content'-> promptString} asDictionary.
				
	messages := { message }.
	
	entityDict := {'model' ->  modelString.
				   'messages' -> messages.
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
OpenAIService >> promptGpt35: promptString [
	^ self prompt: promptString model: 'gpt-3.5-turbo'
]

{ #category : #accessing }
OpenAIService >> urlBase [
	^ urlBase
]

{ #category : #accessing }
OpenAIService >> urlBase: aString [
	urlBase := aString
]