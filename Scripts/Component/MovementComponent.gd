extends Node2D
class_name MovementComponent

@export var speed = 200.0

var direction: Vector2 = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	owner.velocity = direction * speed
	owner.move_and_slide()

func SetDirection(newDirection: Vector2) -> void:
	direction = newDirection
