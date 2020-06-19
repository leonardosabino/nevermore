extends Node2D

var gameScene = load("res://scenes/game.tscn")

func _ready():
	pass 

func _process(delta):
	if Input.is_action_just_pressed("ui_enter"):
		var game = gameScene.instance()
		game.set_global_position(Vector2(0,0))
		get_node("/root/main").add_child(game)
		queue_free()
	pass
