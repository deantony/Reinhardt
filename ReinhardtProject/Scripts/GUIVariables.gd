extends Node

var screen_width = ProjectSettings.get("display/window/size/width")
var screen_height = ProjectSettings.get("display/window/size/height")

func top_menu_size():
	return Vector2(screen_width, screen_height / 25)
func top_menu_pos():
	return Vector2(0, 0)
func menu_color():
	return Color(0, 0, 1, .6)
