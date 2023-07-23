extends Node3D

const SPEED = 30.0
@export var flight_time = 1.1
@onready var ray_cast_3d = $RayCast3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_3d.is_colliding():
		queue_free()
	position += transform.basis * Vector3(0,0, -SPEED) * delta
	if flight_time > 0:
		flight_time += -1*delta
	else:
		queue_free()
