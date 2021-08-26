extends Control

# will need to configure this somehow, either with ip of actual server or an ip setting method
const ip = "127.0.0.1"
const port = 5000

var network = NetworkedMultiplayerENet.new()

func _ready():
	ConnectToServer()

func ConnectToServer():
	print('Player name: '+ Global.get_player_name())
	network.create_client(ip, port)
	get_tree().set_network_peer(network)
	
	get_tree().connect("connection_failed", self, "_on_connection_failed")
	get_tree().connect("connected_to_server", self, "_on_connection_succeeded")


func _on_connection_failed():
	print('Failed to connect to server :(')
	
func _on_connection_succeeded():
	print('Connected to server!')
