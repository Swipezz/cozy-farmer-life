extends CharacterBody2D
class_name Player

@export var movement : MovementComponent
@export var animation : PlayerAnimation

var listText : Array[String] = [
    "1?",
    "Hola sinor 1",
    "2",
    "Its me da mario 64...",
] 

func _physics_process(_delta: float) -> void:
    var direction := Input.get_vector("Left", "Right", "Up", "Down")
    animation.SetVector2Direction(direction.normalized())
    movement.SetDirection(direction.normalized())

    if Input.is_action_just_pressed("Chat"):
        print(get_parent())
        DialogManager.startDialog(global_position, listText)


func sendChat():
    print()

