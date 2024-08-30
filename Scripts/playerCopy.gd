extends CharacterBody2D

@export var SPEED : int  = 100 
@onready var animations = $AnimationPlayer
var current_direction = "none"

func player_movement(delta):
	
	if Input.is_action_pressed("move_right"):
		current_direction = "right"
		play_animation(1)
		velocity.x = SPEED
		velocity.y = 0
	elif Input.is_action_pressed("move_left"):
		current_direction = "left"
		play_animation(1)
		velocity.x = -SPEED
		velocity.y = 0
	elif Input.is_action_pressed("move_down"):
		current_direction = "down"
		play_animation(1)
		velocity.y = SPEED
		velocity.x = 0
	elif Input.is_action_pressed("move_up"):
		current_direction = "up"
		play_animation(1)
		velocity.y = -SPEED
		velocity.x = 0
	else: 
		play_animation(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()
	
func play_animation(movement):
	var direction = current_direction
	var animation = $AnimatedSprite2D
	
	if direction == "right":
		animation.flip_h = false
		if movement == 1:
			animation.play("side_walk")
		elif movement == 0:
			animation.play("side_idle")
			
	if direction == "left":
		animation.flip_h = true
		if movement == 1:
			animation.play("side_walk")
		elif movement == 0:
			animation.play("side_idle")
	
	if direction == "down":
		animation.flip_h = true
		if movement == 1:
			animation.play("front_walk")
		elif movement == 0:
			animation.play("front_idle")
			
	if direction == "up":
		animation.flip_h = true
		if movement == 1:
			animation.play("back_walk")
		elif movement == 0:
			animation.play("back_idle")
			
func health(_healthCounter):
	_healthCounter = 100
	# attack reduces  health -= 2
	pass
	

func sanity(_sanityCounter):
	_sanityCounter  = 100
	# sanity declines by a number when outside safezones aka campfire spots and
	# if not near safezone sanity ticks down per second. 
	pass

func interactions():
	# apply interact object
	# restrict only to object you can interact with
	# interaction list.
	pass
	
func attack():
	if Input.is_action_pressed("attack_button"):
		animations.play("attack") 

func _ready():
	$AnimatedSprite2D.play("front_idle")
	
func _physics_process(delta):
	player_movement(delta)

	move_and_slide()
