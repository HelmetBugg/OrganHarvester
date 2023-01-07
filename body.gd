extends Node2D

var occupied = true
var harvested = false
var scene_instance

func _ready():
	toggle_occupied()
	add_to_group("bodies")
	
	
func toggle_occupied():
	if occupied:
		$graphic.visible = false
		$open_button.visible = false
		occupied = false
	else:
		$graphic.visible = true
		$open_button.visible = true
		occupied = true		
		

func _on_open_button_pressed():	#get_tree().change_scene_to(load('res://operation_room.tscn'))
	var operating_room_scene = load("res://operation_room.tscn")
	var instance = operating_room_scene.instance()
	instance.current_body = self
	get_parent().add_child(instance)
	
