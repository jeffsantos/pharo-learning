Class {
	#name : #ClassificationProblem,
	#superclass : #Object,
	#instVars : [
		'dataSet',
		'randomGenerator',
		'f'
	],
	#category : #'JBS-NeuralNetwork'
}

{ #category : #accessing }
ClassificationProblem >> dataSet [
	^ dataSet
]

{ #category : #accessing }
ClassificationProblem >> dataSet: anObject [
	dataSet := anObject
]

{ #category : #accessing }
ClassificationProblem >> f [
	^ f
]

{ #category : #accessing }
ClassificationProblem >> f: aBlock [
	f := aBlock
]

{ #category : #'as yet unclassified' }
ClassificationProblem >> generateLinearClassification [
	| somePoints x pairs data lineChart scatterChart compositeChart |
	
	scatterChart := self plotDataSet.
	
	somePoints := OrderedCollection new.
	
	10 timesRepeat: [ 
		x := (randomGenerator nextInteger: 50) - 25.
		somePoints add: { x . f value: x } ].
		
	pairs := somePoints collect: [ :each | 
										each first -> each second ].
				
	data := GtPlotterDataGroup new values: pairs.
	data := data background: Color black.
	
	lineChart := GtPlotterLineChart new
		with: data;
		valueX: #key;
		scaleX: GtPlotterLinearScale new;
		labelFormatX: [ :xi | xi asString ];
		titleX: 'x';
		"ticksX: 5;"
		valueY: #value;
		scaleY: GtPlotterLinearScale new;
		titleY: 'y';
		"ticksY: 5;"
		minX: -25;
		maxX: 25;
		minY: -25;
		maxY:25.
		
	compositeChart := GtPlotterCompositeChart new.
	
	^ compositeChart 
		addPlot: scatterChart;
		addPlot: lineChart;
		yourself
]

{ #category : #'instance creation' }
ClassificationProblem >> generateRandomDataSet [

	| x y |
	dataSet := OrderedCollection new.
	
	500 timesRepeat: [ 
		x := (randomGenerator nextInteger: 50) - 25.
		y := (randomGenerator nextInteger: 50) - 25.
		dataSet add: { x . y . f value: x } ].
		
	^ dataSet
]

{ #category : #initialization }
ClassificationProblem >> initialize [
	randomGenerator := Random new seed: 42.
]

{ #category : #'as yet unclassified' }
ClassificationProblem >> plot [
	| compositeChart scatterChart lineChart |
	
	scatterChart := self plotDataSet.
	lineChart := self generateLinearClassification.
	
	compositeChart := GtPlotterCompositeChart new.
	^ compositeChart 
		addPlot: scatterChart;
		addPlot: lineChart;
		yourself
]

{ #category : #'as yet unclassified' }
ClassificationProblem >> plotDataSet [
	| pairs data scatterChart |
	
	pairs := OrderedCollection new.
		
	pairs := dataSet collect: [ :each | each first -> each second ].
		
	data := GtPlotterDataGroup new values: pairs.
	data := data background: [ :each | 
		(each value > (f value: each key))
			ifTrue: [Color red ] 
			ifFalse: [Color blue ]].
		
	scatterChart := GtPlotterScatterChart new
		with: data;
		valueX: #key;
		scaleX: GtPlotterLinearScale new;
		labelFormatX: [ :x | x asString ];
		titleX: 'x';
		"ticksX: 5;"
		valueY: #value;
		scaleY: GtPlotterLinearScale new;
		titleY: 'y';
		"ticksY: 5;"
		minX: -25;
		maxX: 25;
		minY: -25;
		maxY:25.
		
	^ scatterChart
]
