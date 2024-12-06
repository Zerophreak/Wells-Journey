extends StaticBody2D

bool flameState = false
var player = null
bool sanityState = false
var sanity = 100
var time = 0.5

# Object to save your game and restore sanity
# Ignite object to save game 
# Ignited restores sanity over time.

func flameStateManager():
	pass
	
func Safestate():
	
	pass

func _on_sanity_area_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	player = body
	sanityState = true
	pass 

func _on_sanity_area_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	player = body
	sanityState = false
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
