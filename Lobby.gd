extends Node

var match_resource = load("res://Match.tscn")

var text : String = ''

func _on_LineEdit_text_changed(new_text):
	text = new_text

func _on_Join_pressed():
	if textIsValid():
		var root = get_tree().get_root()
		var current_scene = root.get_child(root.get_child_count() - 1)
		root.remove_child(current_scene)
		current_scene.call_deferred("free")
		
		Global.set_player_name(text)
		
		var Match = match_resource.instance()
		root.add_child(Match)
	pass
	
func textIsValid():
	return text.length() >= 3
