extends TextureButton
var instructions = load("res://scenes/instructions.tscn").instance()

func _ready():
	self.connect("pressed", self, "on_pressed")
	pass

func on_pressed():
	if get_node("/root/main/").has_node("instructions") == false:
		var modal = instructions
		modal.set_global_position(Vector2(0,0))
		get_node("/root/main/").add_child(modal)
	pass
