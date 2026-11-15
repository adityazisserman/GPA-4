extends CharacterBody2D
var POS = Vector2.ZERO


func _ready() -> void:
	POS = position

func _physics_process(delta: float) -> void:
	if (velocity.x != -300):
		position = POS
	velocity.x = -300	
	move_and_slide()
