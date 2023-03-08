extends Node

var screen_width = ProjectSettings.get("display/window/size/width")
var screen_height = ProjectSettings.get("display/window/size/height")

func top_menu_size():
	return Vector2(screen_width, screen_height / 25)
func top_menu_pos():
	return Vector2(0, 0)
func menu_color():
	return Color(0, 0, 1, .6)
func get_screen_width():
	return screen_width
func get_screen_height():
	return screen_height - top_menu_size().y
func get_screen_start_pos():
	return Vector2(0, top_menu_size().y)
func two_grid_size():
	return Vector2(screen_width / 2, get_screen_height())
func right_grid_pos():
	return Vector2(two_grid_size().x, get_screen_start_pos().y)
	
