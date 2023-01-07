extends Label

signal money_changed(value, increase_decrease)
var money = 0

func _ready():
	update()
	

func update():
	self.text = "Money: $" + str(money)
