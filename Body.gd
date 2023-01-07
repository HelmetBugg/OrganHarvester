extends Area2D

export var state = "initial"
var initial_position = Vector2()
var canvas

func _ready():
	canvas = get_node("CanvasLayer")

func _physics_process(_delta):
	update()

func _on_Body_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		# On click
		if event.button_index == BUTTON_LEFT and event.pressed:
			initial_position = get_local_mouse_position()
		# On release
		elif event.button_index == BUTTON_LEFT and !event.pressed:
			draw_line(initial_position, get_local_mouse_position(), Color(255, 0, 0), 10)
			print(initial_position, get_local_mouse_position())
			#canvas.draw(initial_position, position)
