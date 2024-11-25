Class {
	#name : 'ChatGPTRoot',
	#superclass : 'SBSComponent',
	#instVars : [
		'conversation',
		'openai'
	],
	#category : 'JBS-OpenaAI-ChatGPT',
	#package : 'JBS-OpenaAI-ChatGPT'
}

{ #category : 'class initialization' }
ChatGPTRoot class >> initialize [
	"Register the class with its route (url)"

	(WAAdmin register: self asApplicationAt: 'chatgpt')
		addLibrary: JQDeploymentLibrary;
		addLibrary: SBSDeploymentLibrary.

]

{ #category : 'private - actions' }
ChatGPTRoot >> askGPT [

	| completion |
	
	completion := openai promptGpt4o: conversation.
	
	^ completion response.
]

{ #category : 'accessing' }
ChatGPTRoot >> conversation [
	^ conversation ifNil: [ conversation := Conversation new ]
]

{ #category : 'initialization' }
ChatGPTRoot >> initialize [ 
	| token | 
	super initialize.
	
	token := (FileLocator home / '.secrets/open-ai-api-key.txt') contents allButLast.
	openai := OpenAIService createWithKey: token.
]

{ #category : 'rendering' }
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

{ #category : 'updating' }
ChatGPTRoot >> updateRoot: anHtmlRoot [
    super updateRoot: anHtmlRoot.
    anHtmlRoot title: 'ChatGPT in Pharo'
]
