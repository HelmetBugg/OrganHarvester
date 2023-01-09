extends Node2D

var current_body
		
func _on_Button3_pressed():
	#$AudioStreamPlayer.set_loop(false)
	$AudioStreamPlayer.play()
	yield($AudioStreamPlayer, "finished")
	print("audio should play!")
	current_body.toggle_occupied()
	get_parent().operating = false
	self.queue_free()
