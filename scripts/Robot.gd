extends KinematicBody2D

var soda = 100
var water = 100
var speed = 1
var amIAlive

signal robotStatusChanged

func _ready():
	add_to_group("robot")
	amIAlive = true
	set_fixed_process(true)

func _fixed_process(delta):
	checkLife()
	if !amIAlive:
		get_node(".").queue_free()
	
	
	if water < soda:
		searchFor("water", delta)
	
	if soda < water:
		searchFor("soda", delta)
	
	if is_colliding():
		if get_collider().is_in_group("water"):
			drinkWater()
		
		if get_collider().is_in_group("soda"):
			drinkSoda()



func checkLife():
	if soda <= 0 || water <= 0:
		amIAlive = false
		return amIAlive

func loseLife():
	# Drains life and water from the robot when is called
	soda -= 2
	water -= 4
	
	# Emits signal to refresh label
	emit_signal("robotStatusChanged", soda, water)

func _on_Timer_timeout():
	# Robot must lose life every second
	loseLife()

func drinkSoda():
	soda = 100

func drinkWater():
	water = 100

func searchFor(need, delta):
	# Search for water or soda accordingly with the need
	if need == "water":
		var waterPosition
		var robotPosition = get_pos()
		var targetPosition
		
		for waterBottle in get_tree().get_nodes_in_group("water"):
			waterPosition = waterBottle.get("position")
		
		if robotPosition != waterPosition:
			targetPosition = waterPosition - get_pos()
			robotPosition += targetPosition * speed * delta
			move_to(robotPosition)
			set_pos(robotPosition)
	
	
	if need == "soda":
		var sodaPosition
		var robotPosition = get_pos()
		var targetPosition
		
		for sodaBottle in get_tree().get_nodes_in_group("soda"):
			sodaPosition = sodaBottle.get("position")
		
		if robotPosition != sodaPosition:
			targetPosition = sodaPosition - get_pos()
			robotPosition += targetPosition * speed * delta
			move_to(robotPosition)
			set_pos(robotPosition)
