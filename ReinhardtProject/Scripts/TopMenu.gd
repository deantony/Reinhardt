extends Control

var gui_variables = preload("res://Scripts/GUIVariables.gd")
var gui = gui_variables.new()

func _ready():
	$GridContainer.columns = $GridContainer.get_child_count()
	$Background.rect_size = gui.top_menu_size()
	$Background.rect_position = gui.top_menu_pos()
	$Background.color = gui.menu_color()
	
	$GridContainer.rect_size = gui.top_menu_size()
	$GridContainer.rect_position = gui.top_menu_pos()


func _on_Home_button_down():
	get_tree().change_scene("res://Scenes/Home.tscn")
func _on_Quit_button_down():
	get_tree().quit()
