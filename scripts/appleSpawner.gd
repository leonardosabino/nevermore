extends Node2D

var preApple = preload("res://scenes/apple.tscn")
onready var main = get_node("/root/main");
var interval = 1

func _ready():
	pass


func _process(delta):
	
	if interval > 0:
		interval -= delta
	else:
		interval = rand_range(0, _difficult_frequency())
		var apple = preApple.instance()
		apple.set_global_position(Vector2(rand_range(0, 1024), -64))
		get_owner().add_child(apple)
		pass
	pass
	
func _difficult_frequency():
	if main.score > 150:
		return 0.1
	if main.score > 100:
		return 0.2
	if main.score > 50:
		return 0.3
	else:
		return 0.5
	pass
