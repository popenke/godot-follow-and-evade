extends Node2D

var sodaScene = load("res://scenes/Soda.tscn")
var waterScene = load("res://scenes/Water.tscn")

func _on_Timer_timeout():
	var sodaNode = sodaScene.instance()
	var waterNode = waterScene.instance()
	
	add_child(sodaNode)
	add_child(waterNode)
