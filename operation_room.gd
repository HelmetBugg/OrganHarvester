extends Node2D

var current_body

func _ready():
	spawnOrgans()

func spawnOrgans():
	print("spawned em")

func _on_Button3_pressed():
	current_body.toggle_occupied()
	self.queue_free()
	
