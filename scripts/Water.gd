extends Node2D

var positionX
var positionY

func _ready():
	positionX = get_pos().x
	positionY = get_pos().y

func _on_Timer_timeout():
	get_node(".").queue_free()
