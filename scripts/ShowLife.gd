extends Label

var energyText = "Energy: "
var waterText = " Water: "

func _on_Robot_robotStatusChanged(soda, water):
	set_text(energyText + str(soda) + waterText + str(water))
