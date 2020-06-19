extends Node2D

var starter = load("res://scenes/starter.tscn").instance()
var free = false

func _ready():
	pass 

func _process(delta):
	if Input.is_action_just_pressed("ui_enter"):
		starter.set_global_position(Vector2(0,0))
		get_node("/root/main").add_child(starter)
		get_node("/root/main").setScore(0)
		get_tree().paused = false
		free = true
		queue_free()
		pass
	pass


func _exit_tree():
	if !free:
		starter.free()
