extends TextureButton

func _ready():
	self.connect("pressed", self, "on_pressed")
	pass

func _process(delta):
	pass
	
func on_pressed():
	Input.action_press("ui_enter", 1)
	pass
