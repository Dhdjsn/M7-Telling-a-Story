extends Control

@onready var rich_text_label: RichTextLabel = %RichTextLabel
@onready var next_button: Button = %NextButton

var dialogue_items : Array[String] = [ 
 "I love my cat",
 "He's pretty cool",
 "He does act like a little demon sometimes",
]

var current_item_index := 0

func _ready() -> void:
	show_text()
	next_button.pressed.connect(advance)

func show_text() -> void:
	var current_item := dialogue_items[current_item_index]
	rich_text_label.text = current_item
	rich_text_label.visible_ratio = 0.0
	var tween := create_tween()
	var text_appearing_duration := 1.2
	tween.tween_property(rich_text_label, "visible ration", 1.0, text_appearing_duration)
	
func advance() -> void:
	current_item_index +=1
	if current_item_index == dialogue_items.size():
		get_tree().quit()
	else:
		show_text()
