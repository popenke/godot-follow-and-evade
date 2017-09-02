extends Label

var timePassed = 0

func _ready():
	set_process(true)

func _process(delta):
	set_text("Time: " + str(timePassed))

func _on_GameTimer_timeout():
	if get_tree().get_nodes_in_group("robot").size() > 0:
		timePassed += 1
