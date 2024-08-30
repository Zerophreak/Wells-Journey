extends StaticBody2D

var wellState 
var resourcesCollected
var player = null
var sanityState = false
var sanity = 100
var time = 0.25

# Narrative object
# Only respawn point for player because your bound to this well 
# Single point to feed resources 
# Need to feed it resources for progression
# Need some dialog setup

func _on_sanity_area_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	player = body
	sanityState = true
	pass # Replace with function body.


func _on_sanity_area_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	player = body
	sanityState = false
	pass 
	
func resources():
	pass 
	
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if sanityState:
		sanity += delta * time
	else:
		sanity -= delta * time
	
