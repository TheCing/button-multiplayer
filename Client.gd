extends Node

const ip = "1.27.0.0.1"
const port = 5000

var network = NetworkedMultiplayerENet.new()

func _ready():
	ConnectToServer()

func ConnectToServer():
	network.create_client(ip, port)
	get_tree().set_network_peer(network)
	print('server started')
	
	
	network.connect("connection_failed",    self, "_OnConnectionFailed"   )
	network.connect("connection_succeeded", self, "_OnConnectionSucceeded")

func _OnConnectionFailed(player_id):
	print('failed to connect to server')
	
func _OnConnectionSucceeded(player_id):
	print('connected to server!')
	#print('Client ' + str(id) + ' connected to Server')

	#var newClient = load("res://Player.tscn").instance()
	#newClient.set_name(str(id))     # spawn players with their respective names
	#get_tree().get_root().add_child(newClient)
