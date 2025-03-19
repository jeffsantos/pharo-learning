Class {
	#name : #BaselineOfPharoLearning,
	#superclass : #BaselineOf,
	#category : #BaselineOfPharoLearning
}

{ #category : #accessing }
BaselineOfPharoLearning >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Packages"
			spec 
				package: 'JBS-Dice';
				package: 'JBS-Dice-Tests';
				package: 'JBS-MyCounter';
				package: 'JBS-MyCounter-Tests';
				package: 'JBS-OpenAI'
		]
]
