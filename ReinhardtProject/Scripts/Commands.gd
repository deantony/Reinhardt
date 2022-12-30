extends Node

var command_output = []
var pid
var pid_list = []

func os_cmd(directory, command):
	var temp_str = "cd {directory} && {command}"
	var fin_str = temp_str.format({"directory": directory, "command": command})
	pid = OS.execute("CMD.exe", ["/C", fin_str], true, command_output)
	pid_list.append(pid)
func os_cmd_no_block(directory, command):
	var temp_str = "cd {directory} && {command}"
	var fin_str = temp_str.format({"directory": directory, "command": command})
	pid = OS.execute("CMD.exe", ["/C", fin_str], false, command_output)
	pid_list.append(pid)
