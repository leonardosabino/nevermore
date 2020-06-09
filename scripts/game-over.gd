extends Node2D

func _ready():
	pass 

func _process(delta):
	if Input.is_action_just_pressed("ui_enter"):
		var tree_node: SceneTree = get_tree()
		tree_node.paused = false
		tree_node.reload_current_scene()
	pass
