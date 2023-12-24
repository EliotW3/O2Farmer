extends Node2D

var scene = preload("res://main.tscn").instantiate()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_button_button_down():
	$LandingControl/PlayButton.icon = load("res://Assets/play2.png")



func _on_play_button_button_up():
	$LandingControl/PlayButton.icon = load("res://Assets/play1.png")
	get_tree().root.add_child(scene)
	$LandingControl.hide()
	
	
