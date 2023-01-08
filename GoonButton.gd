extends Button

export var debug = false
var timer = Timer.new() 
var ProgressBar
var Sprite

func _ready():
	ProgressBar = get_node("../ProgressBar")
	Sprite = get_node("../SpriteSheet")

func _on_GoonButton_pressed(): 
	$AudioStreamPlayer.play()
	Sprite.frame = 1
	timer.connect("timeout",self,"fetch_body") 
	timer.wait_time = 2
	timer.one_shot = true
	add_child(timer)
	timer.start()


func _process(delta):
	ProgressBar.value = 10 * (timer.time_left / (timer.wait_time - timer.time_left))


func fetch_body():
	Sprite.frame = 0
	var bodies = get_tree().get_nodes_in_group("bodies")
	for body in bodies:
		if !body.occupied:
			body.toggle_occupied()
			return
