extends Control

const MIN_VERSION = 10
const MIN_RAM = 4000
const MIN_STORAGE = 50000

# Set Plugin Related Variables
var _plugin_name = "GetHardware"
var _android_plugin

var os_version
var total_ram
var total_storage
var performance_mode = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Engine.has_singleton(_plugin_name):
		_android_plugin = Engine.get_singleton(_plugin_name)
		os_version = _android_plugin.getAndroidVersion()
		os_version = int(os_version.split(".")[0])
		total_ram = _android_plugin.getTotalRAM()
		total_storage = _android_plugin.getNonVolatileMemoryInfo()
		performance_mode = requirePerfomanceMode()
		
	else:
		printerr("Couldn't find plugin " + _plugin_name)
	
	os_version = OS.get_version() if os_version == null else os_version
	total_ram = (OS.get_memory_info().physical / 1073741824) if total_ram == null else total_ram
	total_storage = "N/A" if total_ram == null else total_storage
	
	%Info.text = str(
		"OS Name: ", OS.get_name(), "\n",
		"OS Model: ", OS.get_model_name(), "\n",
		"OS Version: ", os_version, "\n",
		"Memory: ", total_ram, "\n",
		"Processor: ", OS.get_processor_name(), "\n",
		"Storage: ", total_storage, "\n",
		"Performance Mode: ", performance_mode
		)


# Function to check performance
func requirePerfomanceMode():
	var performanceMode = false
	if _android_plugin:
		var total_ram = _android_plugin.getTotalRAM()
		var cpu_info = _android_plugin.getCPUInfo()
		var cpu_speed = _android_plugin.getCPUSpeed()
		var storage = _android_plugin.getNonVolatileMemoryInfo()
		var os_version = _android_plugin.getAndroidVersion()
		var os_int = int(os_version.split(".")[0])
		if os_int <= MIN_VERSION or total_ram <= MIN_RAM or storage <= MIN_STORAGE:
			performanceMode = true
	return performanceMode

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func copy_text() -> void:
	DisplayServer.clipboard_set("Hey, it works!")
	%Copied.visible = true

func paste_text() -> void:
	%RichTextLabel.text = str("Result: ", DisplayServer.clipboard_get())
