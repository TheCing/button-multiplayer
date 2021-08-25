extends Node

func _ready():
	get_node("Button").connect("pressed", self, "_on_Button_pressed")

func _on_Button_pressed():
	# call backend with update
	var labelText = get_node("Label").text == "Hello world!"
	get_node("Label").text = "Goodbye world!" if labelText else "Hello world!"

func _update_count_text(count):
	pass
