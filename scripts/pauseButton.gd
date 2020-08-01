extends TextureButton

var pauseScene = load("res://scenes/pause.tscn")

func _ready():
	self.connect("button_down", self, "on_pressed")
	pass

func on_pressed():
	_pause_menu()
	pass
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		_pause_menu()
	pass

func _pause_menu():
	if (!get_node("/root/main/").has_node("pause")): 
		get_node("/root/main/").add_child(pauseScene.instance())
	else:
		get_node("/root/main/pause").queue_free()
	pass
