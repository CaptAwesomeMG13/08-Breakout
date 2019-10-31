extends Node

export var score = 0
export var lives = 3

func increase_score(s):
 score += int(s)
 find_node("Score").update_score()
 
func decrease_lives():
 lives -= 1
 find_node("Lives").update_lives()
 if lives <= 0:
  get_tree().change_scene("res://Scenes/End.tscn")
 if score >= 4510:
  get_tree().change_scene("res://Scenes/World2.tscn")
 if score >= 9020:
  get_tree().change_scene("res://Scenes/World3.tscn")