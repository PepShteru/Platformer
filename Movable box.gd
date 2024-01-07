extends KinematicBody2D
class_name MovableBox

export var gravity = 100

var velocity = Vector2.ZERO
var elevator_area: Area2D

func _physics_process(delta):
	velocity.y += gravity
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity = Vector2.ZERO
	

func slide(vector):
	velocity.x = vector.x
	
func _ready():
	# Add the box to a group so that the character can identify it during collisions
	add_to_group("box")
	
	
