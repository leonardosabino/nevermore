extends Node2D
	
var score = 0 setget setScore
var scoreMax = 0
var volume = 0 setget setVolume

signal score_changed

func _ready():
	load_game()
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), volume)
	pass

func _process(delta):
	# Global Score Game
	if has_node("/root/main/game"): 
		setScore(score + delta)
		pass
	
	if (scoreMax < score):
		scoreMax = score
	pass
	
func setScore(value):
	emit_signal("score_changed")
	score = value
	pass
	
func setVolume(value):
	volume = value
	pass
	
func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	var save_dict = {
		"scoreMax": scoreMax,
		"volume": volume
	}
	save_game.store_var(save_dict)
	save_game.close()
	
func _exit_tree():
	save_game()

func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save") && save_game.get_var() != 'Null':
		return 

	save_game.open("user://savegame.save", File.READ)
	var node_data = save_game.get_var()
	
	volume = node_data["volume"]
	scoreMax = node_data["scoreMax"]
		
	save_game.close()
