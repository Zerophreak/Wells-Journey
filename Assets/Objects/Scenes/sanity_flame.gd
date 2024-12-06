extends StaticBody2D
var flameState = false
var player = null
var sanityState = false

#Object to save game
# when object ignited set game is saved
# Ask to save yes or no
# Research object as method to save

func saveState():
	pass
	
func _on_sanity_area_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	player = body
	sanityState = true
	pass 


func _on_sanity_area_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	player = body
	sanityState = false
	pass 
	
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
