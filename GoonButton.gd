extends Button

func _on_GoonButton_pressed():
	var bodies = get_tree().get_nodes_in_group("bodies")
	for body in bodies:
		if !body.occupied:
			body.toggle_occupied()
			return
