extends Node2D

var sodaScene = load("res://scenes/Soda.tscn")
var waterScene = load("res://scenes/Water.tscn")
var robotScene = load("res://scenes/Robot.tscn")

var negativeRange = -300.0
var positiveRange = 300.0

func _ready():
	randomize()
	add_child(sodaInstance())
	add_child(waterInstance())
	
	for i in range(100):
		add_child(robotInstance())

func _on_Timer_timeout():
	add_child(sodaInstance())
	add_child(waterInstance())

func waterInstance():
	var waterNode = waterScene.instance()
	var waterRandomPosition = Vector2(rand_range(negativeRange, positiveRange), rand_range(negativeRange, positiveRange))
	waterNode.set_pos(waterRandomPosition)
	return waterNode

func sodaInstance():
	var sodaNode = sodaScene.instance()
	var sodaRandomPosition = Vector2(rand_range(negativeRange, positiveRange), rand_range(negativeRange, positiveRange))
	sodaNode.set_pos(sodaRandomPosition)
	return sodaNode

func robotInstance():
	var robotNode = robotScene.instance()
	var robotRandomPosition = Vector2(rand_range(negativeRange, positiveRange), rand_range(negativeRange, positiveRange))
	robotNode.set_pos(robotRandomPosition)
	return robotNode