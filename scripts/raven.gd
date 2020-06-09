extends KinematicBody2D

var motion = Vector2()
const SPEED = 500
enum {LEFT, RIGHT}
var direction = RIGHT
var game_over = preload("res://scenes/game-over.tscn")
var timer = 0
var timeout = false
var timerover = false

func _physics_process(delta):
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(1)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)
	if (!get_tree().paused):
		var x = 0
		var y = 0

		if Input.is_action_pressed("ui_up") && Input.is_action_pressed("ui_right"):
			$Sprite.play("fly-right")
			direction = RIGHT
			y = -1
			x = 1
		elif Input.is_action_pressed("ui_up") && Input.is_action_pressed("ui_left"):
			$Sprite.play("fly-left")
			direction = LEFT
			y = -1
			x = -1
		elif Input.is_action_pressed("ui_down") && Input.is_action_pressed("ui_left"):
			$Sprite.play("fly-left")
			direction = LEFT
			y = 1
			x = -1
		elif Input.is_action_pressed("ui_down") && Input.is_action_pressed("ui_right"):
			$Sprite.play("fly-right")
			direction = RIGHT
			y = 1
			x = 1
		elif Input.is_action_pressed("ui_left"):
			$Sprite.play("fly-left")
			direction = LEFT
			x = -1
		elif Input.is_action_pressed("ui_right"):
			$Sprite.play("fly-right")
			direction = RIGHT
			x = 1
		elif Input.is_action_pressed("ui_down"):
			y = 1
		elif Input.is_action_pressed("ui_up"):
			y = -1
	
		motion.x = x * SPEED
		motion.y = y * SPEED
		move_and_slide(motion)
	pass
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "AppleBody" && !timerover:
			timer.start()
			get_tree().paused = true
			if direction == RIGHT:
				$Sprite.play("dead-right")
			else:
				$Sprite.play("dead-left")
			pass
			
			if (timeout):
				var gameover = game_over.instance()
				gameover.set_global_position(Vector2(0,0))
				get_node("../").add_child(gameover)
				timerover = true
				get_parent().remove_child(self)
		pass
	pass
	
	pass

func on_timeout_complete():
	timeout = true
	pass
