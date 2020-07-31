extends Node2D

var pauseScene = load("res://scenes/pause.tscn")
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		var pause = pauseScene.instance()
		pause.set_global_position(Vector2(0,0))
		get_node("/root/main").add_child(pause)
	pass
