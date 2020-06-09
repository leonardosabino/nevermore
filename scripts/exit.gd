extends TextureButton

func _ready():
	self.connect("pressed", self, "on_pressed")	
	pass 

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		on_pressed()
	pass
	
func on_pressed():
	get_node("../../").remove_child(get_parent())
	pass
