extends StaticBody2D

var wellState = false
var player = null
var sanityState = false

#var time = 0.5

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
	
