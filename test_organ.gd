extends KinematicBody2D

var dragging = false
signal dragsignal;
var grabbed_offset = Vector2()
var original_position = Vector2()
var over_icebox = false
export var price = 5000

func _ready():
	connect("dragsignal",self,"_set_drag_pc")
	
	
func _process(delta):
	if dragging:
		var mousepos = get_viewport().get_mouse_position()
		position = get_global_mouse_position() + grabbed_offset


func _set_drag_pc():
	dragging=!dragging


func _on_test_organ_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		# On click
		if event.button_index == BUTTON_LEFT and event.pressed:
			grabbed_offset = position - get_global_mouse_position()
			original_position = position
			emit_signal("dragsignal")
			
		# On release
		elif event.button_index == BUTTON_LEFT and !event.pressed:
			if over_icebox:
				print("iceboxed!")
				var money_handler = get_parent().get_node("../Money_Count")
				money_handler.money += price
				money_handler.update()
				self.queue_free()
			else:
				position = original_position
			emit_signal("dragsignal")


func _on_Icebox_body_entered(area):
	over_icebox = true

	
func _on_Icebox_body_exited(body):
	over_icebox = false
