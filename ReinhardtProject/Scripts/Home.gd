extends Node2D

var gui_variables = preload("res://Scripts/GUIVariables.gd")
var gui = gui_variables.new()
var command_functions = load("res://Scripts/Commands.gd")
var commands = command_functions.new()

func _on_StartProject_button_down():
	$CenterContainer/StartProjectPop.visible = true
func _on_LoadProject_button_down():
	$CenterContainer/LoadProjectPop.visible = true
	$CenterContainer/LoadProjectPop.rect_position = Vector2(gui.get_screen_width() / 2, gui.get_screen_start_pos().y)
	$CenterContainer/LoadProjectPop.rect_size = gui.two_grid_size()
func _on_ProjectName_text_entered(new_text):
	var temp_str = "django-admin startproject {project_name}"
	var fin_str = temp_str.format({"project_name": new_text})
	commands.os_cmd("Projects", fin_str)
	$CenterContainer/StartProjectPop.visible = false
	temp_str = "Projects/{project_name}"
	fin_str = temp_str.format({"project_name": new_text})
	commands.set_current_directory(fin_str)
	get_tree().change_scene("res://Scenes/ProjectScreen.tscn")
	


func _on_LoadProjectPop_dir_selected(dir):
	$CenterContainer/LoadProjectPop.visible = false
	var temp_str = []
	for i in range(len(dir) - 6):
		temp_str.append(dir[i + 6])
	var fin_str = "".join(temp_str)
	commands.set_current_directory(fin_str)
	get_tree().change_scene("res://Scenes/ProjectScreen.tscn")
