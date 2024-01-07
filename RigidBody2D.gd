extends RigidBody2D





# Called when the node enters the scene tree for the first time.
func _process(delta):
	angular_velocity = 0
	rotation_degrees = 0.0
	linear_damp = 100
	mass = 100
	friction = 1
#	set_fixed_rotation(true)
	pass # Replace with function body.
	
func _ready():
	mode = MODE_RIGID
