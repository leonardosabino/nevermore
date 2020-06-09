extends Node2D

func _ready():
	pass # Replace with function body.

var pauseStatus = false

func _process(delta):
	
	if !pauseStatus:
		if Input.is_action_just_released("ui_cancel"):
			pauseStatus = true
			get_tree().paused = true
	else:
		if Input.is_action_just_released("ui_cancel"):
			pauseStatus = false
			get_tree().paused = false
			get_parent().remove_child(self)
	pass
