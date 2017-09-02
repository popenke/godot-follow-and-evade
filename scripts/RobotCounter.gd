extends Label

var robots

func _ready():
	set_process(true)

func _process(delta):
	robots = get_tree().get_nodes_in_group("robot").size()
	set_text("Robots alive: " + str(robots))
