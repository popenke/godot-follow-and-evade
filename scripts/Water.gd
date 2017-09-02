extends StaticBody2D

var position

func _ready():
	position = get_pos()

func _on_Timer_timeout():
	get_node(".").queue_free()
