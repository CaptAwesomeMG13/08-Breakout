extends StaticBody2D

var gray = preload("res://Assets/tile_gray.png")
var red = preload("res://Assets/tile_red.png")
var blue = preload("res://Assets/tile_blue.png")
var green = preload("res://Assets/tile_green.png")
var purple = preload("res://Assets/tile_purple.png")
var yellow = preload("res://Assets/tile_yellow.png")

onready var sprite = get_node("Sprite")
var score = 10

var _dying = 0.0
var _dying_delta = 0.1
var _dying_color_delta = 0.05
var _dying_rotate = 0.0
var _dying_rotate_delta = rand_range(-.03,.03)
var _dying_threshhold = 10

onready var t = $Timer
onready var _target = position

func _ready():
	if get_parent().name == "Gray Tiles":
		sprite.set_texture(gray)
	if get_parent().name == "Red Tiles":
		sprite.set_texture(red)
		score = 25
	if get_parent().name == "Blue Tiles":
		sprite.set_texture(blue)
		score = 50
	if get_parent().name == "Green Tiles":
		sprite.set_texture(green)
		score = 75
	if get_parent().name == "Purple Tiles":
		sprite.set_texture(purple)
		score = 100
	if get_parent().name == "Yellow Tiles":
		sprite.set_texture(yellow)
		score = 150
		
	position.y = -30
	var time = rand_range(0,2.5)
	t.set_wait_time(time)
	t.start()
	yield(t, "timeout")
	$Tween.interpolate_property(self, "position", position, _target, 2.0, Tween.TRANS_BOUCE, Tween.EASE_OUT)
	$Tween.start()
	
func _process(delta):
	if _dying > 0:
		_dying += _dying_delta
		position.y += _dying
		rotate(_dying_rotate)
		_dying_rotate+= _dying_rotate_delta
		$ColorRect.color = $ColorRect.color.linear_interpolate(Color(0,0,0,0),_dying_color_delta)
	if _dying > _dying_threshhold:
		queue_free()
		
func kill():
	_dying += _dying_delta
	$CollisionShape2D.queue_free()
	