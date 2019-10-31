extends Node

export var score = 4510
export var lives = 3

func increase_score(s):
 score += int(s)
 find_node("Score").update_score()
 
func decrease_lives():
 lives -= 1
 find_node("Lives").update_lives()
 if lives <= 0:
  get_tree().change_scene("res://Scenes/End.tscn")
func nextLevel():
 if score == 9010:
  get_tree().change_scene("res://Scenes/World3.tscn")
