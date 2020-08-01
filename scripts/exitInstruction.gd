extends TextureButton

func _ready():
	self.connect("pressed", self, "on_pressed")	
	pass 
	
func on_pressed():
	get_node("/root/main/instructions").queue_free()
	pass
