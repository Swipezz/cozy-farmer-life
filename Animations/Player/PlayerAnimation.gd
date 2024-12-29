extends Node2D
class_name PlayerAnimation

@export var animationTree : AnimationTree

var vector2Direction :Vector2 = Vector2.ZERO
var lastFacingDirection = Vector2(0, 1)

func _physics_process(_delta: float) -> void:
    var idle = vector2Direction == Vector2.ZERO

    if not idle:
        lastFacingDirection = vector2Direction

    animationTree.set("parameters/conditions/Idle", idle)
    animationTree.set("parameters/conditions/Run", not idle)

    animationTree.set("parameters/Idle/blend_position", lastFacingDirection)
    animationTree.set("parameters/Run/blend_position", lastFacingDirection)


func SetVector2Direction(newVector2Direction : Vector2) -> void:
    vector2Direction = newVector2Direction