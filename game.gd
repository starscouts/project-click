extends Control

var default: StyleBox = preload("res://default_btn.tres")
var good: StyleBox = preload("res://good_btn.tres")
var bad: StyleBox = preload("res://bad_btn.tres")

var buttons: Array[Button]
var score = 0

func _ready():
	buttons = [
		$GridContainer/Button1, $GridContainer/Button2, $GridContainer/Button3, $GridContainer/Button4, $GridContainer/Button5,
		$GridContainer/Button6, $GridContainer/Button7, $GridContainer/Button8, $GridContainer/Button9, $GridContainer/Button10,
		$GridContainer/Button11, $GridContainer/Button12, $GridContainer/Button13, $GridContainer/Button14, $GridContainer/Button15,
		$GridContainer/Button16, $GridContainer/Button17, $GridContainer/Button18, $GridContainer/Button19, $GridContainer/Button20,
		$GridContainer/Button21, $GridContainer/Button22, $GridContainer/Button23, $GridContainer/Button24, $GridContainer/Button25,
	]

func get_active_buttons(buttons):
	return buttons.filter(
		func (x):
			return x.get_theme_stylebox("normal") == good or \
				x.get_theme_stylebox("normal") == bad
	)

func _on_show_timer_timeout():
	var button: Button = buttons[randi() % buttons.size()]
	
	if randi_range(0, 1) == 1:
		button.add_theme_stylebox_override("normal", good)
	else:
		button.add_theme_stylebox_override("normal", bad)

func _on_hide_timer_timeout():
	for button in get_active_buttons(buttons):
		button.add_theme_stylebox_override("normal", default)

func _on_count_bad():
	score -= 1
	$Score.text = str(score)

func _on_count_good():
	score += 1
	$Score.text = str(score)
