extends KinematicBody2D

signal dragsignal;
var grabbed_offset = Vector2()
var original_position = Vector2()
var over_icebox = false
var dragging = false
var offset = 1000
var rng = RandomNumberGenerator.new()
var grade = 0
var price = 0
var type = 0

func _ready():
	connect("dragsignal",self,"_set_drag_pc")
	add_to_group("organs")
	self.position.y += offset
	
	
func generate_organ():
	self.position.y -= offset
	self.visible = true
	rng.randomize()
	grade = rng.randi_range(1, 6)
	price = grade * 1000
	type = rng.randi_range(0, 8)
	$Label.text = "Grade: " + str(grade) + "\n  Price: " + str(price)
	$SpriteSheet.set_frame(int(type))


func remove_organ():
	self.visible = false	
	self.position.y += offset
	
	
func _process(delta):
	if dragging:
		var mousepos = get_viewport().get_mouse_position()
		position = get_global_mouse_position() + grabbed_offset


func _set_drag_pc():
	dragging=!dragging


func _on_Organ_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			grabbed_offset = position - get_global_mouse_position()
			original_position = position
			emit_signal("dragsignal")
			

		elif event.button_index == BUTTON_LEFT and !event.pressed:
			if over_icebox:
				print("iceboxed!")
				var money_handler = get_parent().get_node("../Money_Count")
				money_handler.money += price
				money_handler.update()
				remove_organ()
			else:
				position = original_position
			emit_signal("dragsignal")


func _on_Icebox_body_entered(area):
	over_icebox = true

func _on_Icebox_body_exited(body):
	over_icebox = false
