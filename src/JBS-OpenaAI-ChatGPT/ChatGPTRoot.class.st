Class {
	#name : #ChatGPTRoot,
	#superclass : #SBSComponent,
	#instVars : [
		'conversation',
		'openai'
	],
	#category : #'JBS-OpenaAI-ChatGPT'
}

{ #category : #'class initialization' }
ChatGPTRoot class >> initialize [
	"Register the class with its route (url)"

	(WAAdmin register: self asApplicationAt: 'chatgpt')
		addLibrary: JQDeploymentLibrary;
		addLibrary: SBSDeploymentLibrary.

]

{ #category : #'as yet unclassified' }
ChatGPTRoot >> askGPT [

	| completion |
	
	completion := openai promptGpt35: conversation.
	
	^ completion response.
]

{ #category : #accessing }
ChatGPTRoot >> conversation [
	^ conversation ifNil: [ conversation := Conversation new ]
]

{ #category : #initialization }
ChatGPTRoot >> initialize [ 
	super initialize.
	openai := OpenAIService createWithKey: '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'.
]

{ #category : #rendering }
ChatGPTRoot >> renderContentOn: html [
	"Main entry point of the view. Render a title."
	
	html heading
		level: 1;
		with: 'ChatGPT in Pharo'.

	html form: [
		html formGroup: [
			html label: 'Digite sua mensagem: '.
			html textArea formControl 
				rows: 3;
				callback: [ :value | self conversation addUserMessage: value ] ].
		
		html formButton 
			bePrimary;
			callback: [ self conversation addAssistantMessage: self askGPT ];
			with: 'Enviar'
		].
	
		html span with: (self conversation lastMessage).
]

{ #category : #updating }
ChatGPTRoot >> updateRoot: anHtmlRoot [
    super updateRoot: anHtmlRoot.
    anHtmlRoot title: 'ChatGPT in Pharo'
]
