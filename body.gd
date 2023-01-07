extends Node2D

var active = true
var harvested = false

func _ready():
	toggleActive()
	add_to_group("bodies")
	
func toggleActive():
	if active:
		$graphic.visible = false
		$open_button.visible = false
		active = false
	else:
		$graphic.visible = true
		$open_button.visible = true
		active = true		

func _on_open_button_pressed():
	get_tree().change_scene_to(load('res://operation_room.tscn'))
