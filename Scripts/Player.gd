extends CharacterBody2D
class_name Player

@export var movement : MovementComponent
@export var animation : PlayerAnimation

func _physics_process(_delta: float) -> void:
    var direction := Input.get_vector("Left", "Right", "Up", "Down")
    animation.SetVector2Direction(direction.normalized())
    movement.SetDirection(direction.normalized())