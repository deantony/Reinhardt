extends Node2D

var gui_variables = preload("res://Scripts/GUIVariables.gd")
var gui = gui_variables.new()
var command_functions = load("res://Scripts/Commands.gd")
var commands = command_functions.new()
var top_menu = preload("res://Scenes/TopMenu.tscn")
func _ready():
	var top_menu_instance = top_menu.instance()
	add_child(top_menu_instance)
	$CenterGrid.rect_position = gui.right_grid_pos()
	$OutputPanel.rect_size = gui.two_grid_size()
	$OutputPanel.rect_position = gui.get_screen_start_pos()
func _print_command_prompt_output():
	for i in range(len(commands.command_output)):
		$OutputPanel/Output.text = commands.command_output[i]
func _on_MakeMigrations_button_down():
	commands.os_cmd(commands.get_current_directory(), "python manage.py makemigrations")
	_print_command_prompt_output()
func _on_Migrate_button_down():
	commands.os_cmd(commands.get_current_directory(), "python manage.py migrate")
	_print_command_prompt_output()
func _on_RunServer_button_down():
	commands.os_cmd_no_block(commands.get_current_directory(), "python manage.py runserver")
	_print_command_prompt_output()
func _on_StopServer_button_down():
	commands.stop_server()
	_print_command_prompt_output()
