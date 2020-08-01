extends Node2D

func _ready():
	get_tree().paused = true
	pass

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = false
		queue_free()
	pass

func _exit_tree():
	get_tree().paused = false
