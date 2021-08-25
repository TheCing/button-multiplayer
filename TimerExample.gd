extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeout", self, "_on_Timer_timeout")

func _on_Timer_timeout():
	$Sprite.visible = !$Sprite.visible
