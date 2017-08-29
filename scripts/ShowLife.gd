extends Label

var energyText = "Energy: "
var waterText = " Water: "

func _on_Robot_robotStatusChanged(energy, water):
	set_text(energyText + str(energy) + waterText + str(water))
