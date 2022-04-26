Class {
	#name : #TBHeaderComponent,
	#superclass : #SBSComponent,
	#category : #'JBS-TinyBlog-Components'
}

{ #category : #rendering }
TBHeaderComponent >> renderBrandOn: html [
	html navigationBarBrand
		url: self application url;
		with: 'TinyBlog'
]

{ #category : #rendering }
TBHeaderComponent >> renderContentOn: html [			
	| bar |
	bar := html navigationBar.
	bar beLight; expandLarge.
	bar background beLight.
	bar with: [ 
		html container: [ 
			self renderBrandOn: html 
			] 
		]
	
]
