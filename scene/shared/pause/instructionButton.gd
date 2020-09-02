extends TextureButton
var instructions = load("res://scene/shared/instructions/instructions.tscn")

func _ready():
	self.connect("pressed", self, "on_pressed")
	pass

func on_pressed():
	if get_node("/root/main/").has_node("instructions") == false:
		get_node("/root/main/").add_child(instructions.instance())
	pass
