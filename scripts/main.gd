extends Node2D

var pauseScreen = preload("res://scenes/pause.tscn")
func _ready():
	pass
	
var pauseStatus = false
var pause = pauseScreen.instance()
var score = 0 setget setScore, getScore
var seconds = 0
var seconds_plus = 0
signal score_changed

func _process(delta):
	seconds += delta

	setScore(seconds);
	
	if !pauseStatus:
		if Input.is_action_just_pressed("ui_cancel"):
			pause.set_global_position(Vector2(0,0))
			get_node("./").add_child(pause)
			pauseStatus = true
	else:
		pauseStatus = false
	pass
	
func setScore(value):
	emit_signal("score_changed")
	score = value
	pass
func getScore():
	return score
	pass
