extends Node

const ip = "127.0.0.1"
const port = 5000

var player_template = load("res://Player.tscn")

var error_code
var network = NetworkedMultiplayerENet.new()

onready var Players = $Match/CenterContainer/HBoxContainer/Players

func _ready():
	ConnectToServer()

func ConnectToServer():
	network.create_client(ip, port)
	get_tree().set_network_peer(network)
	
	error_code = get_tree().connect("connection_failed", self, "_on_connection_failed")
	if error_code != 0:
		print("ERROR: ", error_code)
	error_code = get_tree().connect("connected_to_server", self, "_on_connection_succeeded")
	if error_code != 0:
		print("ERROR: ", error_code)

func _on_connection_failed():
	print('Failed to connect to server :(')
	
func _on_connection_succeeded():
	print('Connected to server!')
	rpc_id(1, "add_new_player", Global.get_player_name())

remote func add_player(user_data : Dictionary, is_me = false):
	print("calling add player")
	var player = player_template.instance()
	player.set_name(str(user_data["id"]))
	Players.add_child(player)
	player.update_data(user_data)
	# player.set_network_master(1 if is_me else 0)

remote func update_player(player_id: int, update_data: Dictionary):
	print("Updating player %d with dictionary %s" % [player_id, str(update_data)])
	Players.get_node(str(player_id)).update_data(update_data)

remote func delete_player(player_id: int):
	Players.get_node(str(player_id)).queue_free()
