extends TextureButton

func _ready():
	self.connect("pressed", self, "on_pressed")	
	pass 
	
func on_pressed():
	if (get_node("/root/main/").has_node("instructions") == false):
		get_node("/root/main/pause").queue_free()
	pass
