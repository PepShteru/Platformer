extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const MAXFALLSPEED = 200
const MAXSPEED = 200
const JUMPFORCE = 400
const ACCEL = 10
var motion = Vector2()
var facing_right = true

func _physics_process(_delta):
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if facing_right == true:
		$Sprite.scale.x = 1
		$Sprite2.scale.x = 1
	else:
		$Sprite.scale.x = -1
		$Sprite2.scale.x = -1
	
	motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)
	
	if Input.is_action_pressed("right"):
		motion.x += ACCEL
		facing_right = true
		$Sprite2.visible = true
		$Sprite.visible = false
		$AnimationPlayer.play("Walk")
	elif Input.is_action_pressed("left"):
		motion.x -= ACCEL
		facing_right = false
		$Sprite2.visible = true
		$Sprite.visible = false
		$AnimationPlayer.play("Walk")
	else: 
		motion.x = lerp(motion.x, 0, 0.2)
		$Sprite.visible = true
		$Sprite2.visible = false
		$AnimationPlayer.play("Idle")
		
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			motion.y = -JUMPFORCE
	
	motion = move_and_slide(motion, UP, false, 4, 0.785698, true)

	for i in get_slide_count():
		var collision = get_slide_collision(i)
		var colliding_body = collision.collider
		
		if colliding_body is KinematicBody2D and colliding_body.is_in_group("box"):
			var push_direction = -collision.normal  # Get the direction to push the box
			var push_distance = 1 # Adjust this value based on how far you want to push the box
			
			var target_position = colliding_body.global_position + push_direction * push_distance
			colliding_body.global_position = colliding_body.global_position.linear_interpolate(target_position, 1)

