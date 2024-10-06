extends Node

var player_current_attack = false

var current_scene = "world"
var transition_scene = false

var spawnApple = false



#you dont need that
var player_exit_cliffside_posy = 0
var player_exit_cliffside_posx = 0
var player_start_posy = 0
var player_start_posx = 0

func _process(delta: float) -> void:
	pass

func finish_changescenes():

	if transition_scene == true:
		print("print this if transition scene == true")
		transition_scene = false
		
		if current_scene == "world":
			print("current scene change to sortiranjeeeeeeeeeeee")
			current_scene = "sortiranje" 
		else:
			current_scene = "world"
			
func switchback():
		print("okej?")
