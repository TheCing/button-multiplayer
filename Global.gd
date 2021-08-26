extends Node

var player_name : String = '' setget set_player_name, get_player_name

func set_player_name(name):
	player_name = name
	
func get_player_name():
	return player_name
