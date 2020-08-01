extends Node2D
	
var score = 0 setget setScore
var volume = 6 setget setVolume

signal score_changed
signal volume_changed

func _process(delta):
	if has_node("/root/main/game"): 
		setScore(score + delta)
		pass
	pass
	
func setScore(value):
	emit_signal("score_changed")
	score = value
	pass
	
func setVolume(value):
	emit_signal("volume_changed")
	volume = value
	pass
	
