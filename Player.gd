extends Node

var user_name : String 
var count : int = 0
var name_template : String = "%s: "
onready var PlayerName = $VBoxContainer/HBoxContainer/PlayerName
onready var Counter = $VBoxContainer/HBoxContainer/Counter

func _on_Button_pressed():
	set_count(count + 1)

func update_data(update_data: Dictionary):
	if update_data["user_name"] != null:
		set_user_name(update_data["user_name"])
	if update_data["count"] != null:
		set_count(update_data["count"])

func set_count(new_count: int) -> void:
	count = new_count
	Counter.text = str(new_count)

func set_user_name(new_user_name) -> void:
	user_name = new_user_name
	PlayerName.text = name_template % user_name
