extends Panel

func _ready():
	get_node("Button").connect("pressed", self, "_on_Button_pressed")

func _on_Button_pressed():
	var labelText = get_node("Label").text == "Hello world!"
	get_node("Label").text = "Goodbye world!" if labelText else "Hello world!"
