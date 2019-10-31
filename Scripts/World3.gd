extends Node

export var score = 13800
export var lives = 3

func increase_score(s):
 score += int(s)
 find_node("Score").update_score()
 
func decrease_lives():
 lives -= 1
 find_node("Lives").update_lives()
 if lives <= 0:
  get_tree().change_scene("res://Scenes/End.tscn")
 if score >= 13820:
  get_tree().change_scene("res://Scenes/Win.tscn")