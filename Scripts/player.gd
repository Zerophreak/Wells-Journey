extends CharacterBody2D

@onready var animations = $AnimationPlayer
@export var health := 100
@export var sanity := 100
var time := 0.5
var SPEED := 120
var current_direction := "none"
var player_state



#Player movement.
func player_movement():
	var direction = Input.get_vector("left","right","move_up","down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state = "walking"
		
	velocity = direction * SPEED
	move_and_slide()
	
	play_animation(direction)
	
#  Play animation for movement.
func play_animation(direction):
	print(direction)
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
		
	if player_state == "walking":
		if direction.y == -1:
			$AnimatedSprite2D.play("north-walk")
		if direction.x == 1:
			$AnimatedSprite2D.play("east-walk")
		if direction.y == 1:
			$AnimatedSprite2D.play("south-walk")
		if direction.x == -1:
			$AnimatedSprite2D.play("west-walk")
			
		if direction.x > 0.5 and direction.y < -0.5:
			$AnimatedSprite2D.play("northeast-walk")
		if direction.x > 0.5 and direction.y > 0.5:
			$AnimatedSprite2D.play("southeast-walk")
		if direction.x < -0.5 and direction.y > 0.5:
			$AnimatedSprite2D.play("southwest-walk")
		if direction.x < -0.5 and direction.y < -0.5:
			$AnimatedSprite2D.play("northwest-walk")
	
func player():
	pass
	
func cameraController():
	pass

func interact():
	# apply interact object
	# restrict only to object you can interact with
	# interaction list.
	pass
	
func attack():
	if Input.is_action_pressed("attack_button"):
		animations.play("attack") 

func upgrades():
	#Set the upgrades and checks the upgrade objects that are active.
	# and add functionality to character
	pass
	
func _ready():
	pass
	
func _physics_process(_delta):
	player_movement()
