extends Node2D

var starterScene = load("res://scene/starter/starter.tscn")

func _ready():
	pass 

func _process(_delta):
	if Input.is_action_just_pressed("ui_enter") || Input.is_action_just_pressed("click"):
		var starterInstance = starterScene.instance()
		get_node("/root/main").add_child(starterInstance)
		get_node("/root/main").setScore(0)
		get_tree().paused = false
		queue_free()
		pass
	pass
