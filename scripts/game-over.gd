extends Node2D

var starterScene = load("res://scenes/starter.tscn")

func _ready():
	pass 

func _process(delta):
	if Input.is_action_just_pressed("ui_enter"):
		var starter = starterScene.instance()
		starter.set_global_position(Vector2(0,0))
		get_node("/root/main").add_child(starter)
		get_node("/root/main").setScore(0)
		get_tree().paused = false
		queue_free()
		pass
	pass
