extends MarginContainer

@onready var label = $MarginContainer/Label
@onready var timer = $LetterDisplayTimer

const maxWidth = 256

var text = ""
var letterIndex = 0

var letterTime = 0.03
var spaceTime = 0.06
var punctuationTime = 0.2

signal finishedDisplaying()

func displayText(textToDisplay: String):
    text = textToDisplay
    letterIndex = 0  # Reset letter index

    # Set label text and calculate wrapping
    label.text = textToDisplay
    update_size()

    label.text = ""  # Clear label to start displaying text one letter at a time
    _displayLetter()

func update_size():
    # Update size and wrapping
    custom_minimum_size.x = min(size.x, maxWidth)

    if size.x > maxWidth:
        label.autowrap_mode = TextServer.AUTOWRAP_WORD
        size = label.get_minimum_size()  # Ensure size is recalculated
        custom_minimum_size.y = size.y

    # Adjust position
    global_position.x -= size.x / 2
    global_position.y -= size.y + 24

func _displayLetter():
    if letterIndex < text.length():
        label.text += text[letterIndex]
        letterIndex += 1

        # Determine delay based on character type
        match text[letterIndex - 1]:
            "!", ".", ",", "?":
                timer.start(punctuationTime)
            " ":
                timer.start(spaceTime)
            _:
                timer.start(letterTime)
    else:
        # Emit signal when done
        finishedDisplaying.emit()

func _on_letter_display_timer_timeout() -> void:
    _displayLetter()

func _ready():
    # Connect timer timeout to the method
    timer.timeout.connect(_on_letter_display_timer_timeout)
