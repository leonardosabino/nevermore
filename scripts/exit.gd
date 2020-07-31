extends TextureButton

var starter = load("res://scenes/starter.tscn").instance()

func _ready():
	self.connect("pressed", self, "on_pressed")
	pass

func on_pressed():
	get_tree().quit()
	pass
pass	
