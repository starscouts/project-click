extends Button

func _on_pressed():
	if get_theme_stylebox("normal") == get_node("/root/Game/Control").good:
		get_parent().count_good.emit()
	else:
		get_parent().count_bad.emit()
