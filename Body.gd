extends Area2D

export var state = "initial"
var initial_position = Vector2()
var cutting = false
var sprite
var opened_graphic = preload("res://art/body_operation_open_sprite.png")

func _ready():
	sprite = get_node("../Graphic")

func _physics_process(_delta):
	update()

func _on_Body_input_event(viewport, event, shape_idx):
	if state == "initial":
		if event is InputEventMouseButton:
			# On click
			if event.button_index == BUTTON_LEFT and event.pressed and cutting:
				cutting = false
				body_opened()			
			# On release
			elif event.button_index == BUTTON_LEFT and !event.pressed :
				initial_position = get_local_mouse_position()
				_draw()
				cutting = true
			
			
func body_opened():
	state = "open"	
	sprite.set_texture(opened_graphic)
	spawn_organs()
	
func spawn_organs():
	var organs = get_tree().get_nodes_in_group("organs")
	for organ in organs:
		organ.generate_organ()	
			
func _draw():
	if cutting and state == "initial":
		draw_line(initial_position, get_local_mouse_position(), Color(1, 0, 0), 5)
