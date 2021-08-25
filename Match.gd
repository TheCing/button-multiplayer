extends Control

const Player = preload("res://Player.tscn").instance()

func player_join():
	add_child(Player())
	pass
