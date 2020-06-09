extends TextureButton
var instructions = preload("res://scenes/instructions.tscn")

func _ready():
	self.connect("pressed", self, "on_pressed")
	pass


func _process(delta):
	pass
	
func on_pressed():
	if get_parent().has_node("instructions") == false:
		var modal = instructions.instance()
		modal.set_global_position(Vector2(0,0))
		get_node("../").add_child(modal)
	pass
