extends Node2D

var gameScene = load("res://scenes/game.tscn")

func _ready():
	pass 

func _process(_delta):
	if Input.is_action_just_pressed("ui_enter"):
		var game = gameScene.instance()
		get_parent().add_child(game)
		queue_free()
	pass
