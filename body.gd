extends Node2D

var active = true

func _ready():
	toggleActive()
	add_to_group("bodies")
	
func toggleActive():
	if active:
		$graphic.visible = false
		active = false
	else:
		$graphic.visible = true
		active = true		


