extends Label

func _ready():
	pass

func _process(delta):
	if (get_tree().paused):
		set_text('Unpause?')
	else:
		set_text('Pause?')
	pass
