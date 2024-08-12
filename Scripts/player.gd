extends CharacterBody2D

@export var SPEED : int  = 300 
@export var GRAVITY : int = 98 
@onready var animations = $AnimationPlayer


func cameraController():
	# camera fixed to player character.
	pass 
	
	
func handleInput():
	var moveDirection = Input.get_vector("move_left","move_right", "move_up", "move_down")
	velocity = moveDirection * SPEED
	
	
func updateAnimation():
	if velocity.length() == 0:
		if animations.is_playing():
			animations.stop()
	else:
		var direction = "Down"
		if  velocity. x < 0:
			direction = "Left"
		elif velocity.x > 0:
			direction = "Right"
		elif velocity.y < 0: 
			direction = "Up"
	
		animations.play("walk" + direction)


func health():
	# set healt
	# attack reduces  health -= 2
	pass
	

func sanity():
	var sanityCount = 100
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

func _physics_process(delta):
	handleInput()
	move_and_slide()
	updateAnimation()
