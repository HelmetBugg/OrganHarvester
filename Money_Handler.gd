extends Label

signal money_changed(value, increase_decrease)
var money = 0

func _ready():
	update()
	
func update():
	self.text = "Amount needed to build \norphanage: $500,000\nCurrent: $" + str(money)
