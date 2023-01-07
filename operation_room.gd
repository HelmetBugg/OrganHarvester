extends Node2D

func _ready():
	spawnOrgans()

func spawnOrgans():
	print("spawned em")

func _on_Button3_pressed():
	get_tree().change_scene_to(load('res://basement.tscn'))
