extends Button

export var debug = false
var timer = Timer.new() 
var ProgressBar

func _ready():
	ProgressBar = get_node("../ProgressBar")

func _on_GoonButton_pressed(): 
	$AudioStreamPlayer.play()
	timer.connect("timeout",self,"fetch_body") 
	timer.wait_time = 2
	timer.one_shot = true
	add_child(timer)
	timer.start()


func _process(delta):
	ProgressBar.value = 10 * (timer.time_left / (timer.wait_time - timer.time_left))

func fetch_body():
	print("On my way to the graveyard!")
	var bodies = get_tree().get_nodes_in_group("bodies")
	for body in bodies:
		if !body.occupied:
			body.toggle_occupied()
			return
