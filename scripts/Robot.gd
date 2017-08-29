extends Node2D

var energy = 100
var water = 100
var amIAlive

var waterBottle
var sodaBottle

signal robotStatusChanged

func _ready():
	amIAlive = true
	
	waterBottle = get_node("/root/Game/Water")
	sodaBottle = get_node("/root/Game/Soda")
	
	set_process(true)

func _process(delta):
	checkLife()
	if !amIAlive:
		get_node(".").queue_free()
	
	if water < energy:
		searchFor("Water")
	
	if energy < water:
		searchFor("Energy")

func checkLife():
	if energy <= 0 || water <= 0:
		amIAlive = false
		return amIAlive

func loseLife():
	# Drains life and water from the robot when is called
	energy -= 2
	water -= 4
	
	# Emits signal to refresh label
	emit_signal("robotStatusChanged", energy, water)

func _on_Timer_timeout():
	# Robot must lose life every second
	loseLife()

func drinkSoda():
	energy = 100

func drinkWater():
	water = 100

func searchFor(need):
	# Search for water or energy accordingly with the need
	if need == "Water":
		# TODO: Check if there is any resource on scene
		var waterPositionX = waterBottle.get("positionX")
		var waterPositionY = waterBottle.get("positionY")
		
		print("waterX: ", waterPositionX)
		print("waterY: ", waterPositionY)
	
	if need == "Soda":
		var sodaPositionX = sodaBottle.get("positionX")
		var sodaPositionY = sodaBottle.get("positionY")
		
		print("sodaX: ", sodaPositionX)
		print("sodaY: ", sodaPositionY)
