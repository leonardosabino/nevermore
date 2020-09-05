extends KinematicBody2D

enum {LEFT, RIGHT}
const SPEED = 350

var motion = Vector2()
var direction = RIGHT
var gameOverLoad = load("res://scene/gameover/gameOver.tscn")
onready var joystick = get_node("/root/main/game/joystick/button");

func _physics_process(_delta):	
	_move_raven();
	_collision_shape();
	pass
	
func _move_raven():
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
		
		if Input.is_action_pressed('click'):
			var buttonPosition = joystick.get_value()
			move_and_slide(joystick.get_value() * SPEED)
			if (buttonPosition.x > 0):
				direction = RIGHT
				$Sprite.play("fly-right")
			else:
				direction = LEFT
				$Sprite.play("fly-left")
			
#		if Input.is_action_pressed('click'):
#			var target = get_global_mouse_position()
#			var velocity = (target - position).normalized() * SPEED
#			if (target - position).length() > 50:
#				move_and_slide(velocity)
#				if (velocity.x > 0):
#					direction = RIGHT
#					$Sprite.play("fly-right")
#				else:
#					direction = LEFT
#					x = -1
#					$Sprite.play("fly-left")

		
			
	pass
	pass

func _collision_shape():
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "AppleBody":
			get_tree().paused = true
			_create_timer();
			get_node("/root/main/game/game_music/").stream_paused = true
			if direction == RIGHT:
				$Sprite.play("dead-right")
			else:
				$Sprite.play("dead-left")
			pass
		pass
	pass
	pass

func _create_timer():
	var timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(1)
	timer.connect("timeout", self, "_on_timeout", [], CONNECT_DEFERRED)
	add_child(timer)
	timer.start()
	pass

func _on_timeout():
	var gameOver = gameOverLoad.instance()
	get_node("/root/main").add_child(gameOver)
	get_node("/root/main/game").free();
	pass
