extends Node

var current_scene = "world"
var transition_scene = false

var player_exithouse_posx = 30
var player_exithouse_posy = -30
var player_start_posx = 12
var player_start_posy = 12

var game_first_loadin = true

func finish_changescenes():
	if transition_scene == true:
		transition_scene = false
		if current_scene == "world":
			current_scene = "house"
		else:
			current_scene = "world"
