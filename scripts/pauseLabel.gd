extends Label

func _ready():
	pass

func _process(delta):
	if (get_node("/root/main/").has_node("pause")):
		set_text('Unpause?')
	else:
		set_text('Pause?')
	pass
