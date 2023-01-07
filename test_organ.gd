extends KinematicBody2D

var dragging = false
signal dragsignal;
var grabbed_offset = Vector2()

func _ready():
	connect("dragsignal",self,"_set_drag_pc")
	
func _process(delta):
	if dragging:
		var mousepos = get_viewport().get_mouse_position()
		#self.position = Vector2(mousepos.x, mousepos.y)
		position = get_global_mouse_position() + grabbed_offset

func _set_drag_pc():
	dragging=!dragging

func _on_test_organ_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		grabbed_offset = position - get_global_mouse_position()
		if event.button_index == BUTTON_LEFT and event.pressed:
			emit_signal("dragsignal")
		elif event.button_index == BUTTON_LEFT and !event.pressed:
			emit_signal("dragsignal")

