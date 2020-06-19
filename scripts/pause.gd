extends Node2D

func _ready():
	get_tree().paused = true
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = false
		queue_free()
	pass
