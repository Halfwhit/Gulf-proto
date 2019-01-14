extends Node

# class member variables go here, for example:
var player
var hole

func _ready():
	player = get_node("Player")
	hole = get_node("Hole")

func _on_Hole_body_entered(body):
	if body.get_name() == "Player":
		print(body, " GOAAAAAAAAAAAAAAAAL!")