extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var POS = Vector2.ZERO

func _ready() -> void:
	POS = position

func _physics_process(delta: float) -> void:
	for i in $"../Player/boundingbox".get_overlapping_areas():
		if i.is_in_group('branch'):
				if velocity == Vector2.ZERO:
					await get_tree().create_timer(4).timeout			
				velocity += get_gravity() * delta
				i.set_collision_layer_value(1, false)
				i.set_collision_mask_value(1, false)
				$CollisionShape2D.disabled = true
				await get_tree().create_timer(5).timeout
				position = POS
				velocity = Vector2.ZERO
				i.set_collision_layer_value(1, true)
				i.set_collision_mask_value(1, true)
				$CollisionShape2D.disabled = false


		
			

	move_and_slide()
