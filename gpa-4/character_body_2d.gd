extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -600.0

var spritestill = preload("res://still_left.png")
var rightspriterun = preload("res://1794748616704.png")
var leftspriterun = preload("res://1794748616704-mirror.png")

var dashing = false


func _physics_process(delta: float) -> void:
	if dashing:
		velocity.x = -600
		move_and_slide()
		return
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if velocity.x != 0:
		if direction > 0:
			$Sprite2D.texture = rightspriterun
		elif direction < 0:
			$Sprite2D.texture = leftspriterun
	move_and_slide()


func _on_boundingbox_area_entered(area: Area2D) -> void:
	if area.name == "Acorn":
		print("touching")
		dashing = true
		velocity.x = -600
		await get_tree().create_timer(0.5).timeout
		dashing = false
		move_and_slide()
