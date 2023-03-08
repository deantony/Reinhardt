extends Node

var command_output = []
var pid
var pid_list = []
var path = "user://data.ini"

func os_cmd(directory, command):
	var temp_str = "cd {directory} && {command}"
	var fin_str = temp_str.format({"directory": directory, "command": command})
	pid = OS.execute("CMD.exe", ["/C", fin_str], true, command_output)
	pid_list.append(pid)
	return pid
func os_cmd_no_block(directory, command):
	var temp_str = "cd {directory} && {command}"
	var fin_str = temp_str.format({"directory": directory, "command": command})
	pid = OS.execute("CMD.exe", ["/C", fin_str], false, command_output)
	pid_list.append(pid)
	return pid
func stop_server():
	for i in range(len(pid_list)):
		var temp_str = "taskkill /F /PID {id}"
		var fin_str = temp_str.format({"id": pid_list[i]})
		os_cmd(get_current_directory(), fin_str)
	pid_list.empty()

func get_current_directory():
	var config = ConfigFile.new()
	config.load(path)
	return config.get_value("Directory", "Current_Path")
func set_current_directory(directory):
	var config = ConfigFile.new()
	config.set_value("Directory", "Current_Path", directory)
	config.save(path)
