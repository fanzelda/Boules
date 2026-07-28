extends Node

signal move_left
signal move_right
signal move_up
signal move_down

signal interact

func _process(_delta) -> void:
# put "is_action_pressed" if we want true for the whole button press
# put "is_action_just_pressed" if we want true during only one frame 
# after the button press (for a jump ig)

	if Input.is_action_pressed("ui_right"):
		move_right.emit()
	if Input.is_action_pressed("ui_left"):
		move_left.emit()
	if Input.is_action_just_pressed("ui_up"):
		move_up.emit()
	if Input.is_action_just_pressed("ui_down"):
		move_down.emit()
	if Input.is_action_just_pressed("ui_accept"):
		interact.emit()
	
