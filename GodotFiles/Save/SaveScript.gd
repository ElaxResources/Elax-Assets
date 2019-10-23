extends Node

const dictionary = preload ("res://SCRIPT/SAVE/SaveScript_Dict.gd")

# GODOT
var save_folder_path = "res://SCRIPT/SAVE"
# GAME
#var save_folder_path = "user://config/save"

# examples!
# sa("file_name", "num", value)
# load_dict = lo("value")
# text_node.text = str(load_dict["num"])

func sa(save_name : String, save_id, value):
	
	var namefile = "savefile_" + save_name + ".tres"
	var path = save_folder_path.plus_file(namefile)
	var save_game : Resource
	
	if load(path) == null:
		print("Created a new save file")
		save_game = dictionary.new()
		save_game.dict[save_id] = value
	else:
		print("Saving " , save_name)
		save_game = load(path)
		save_game.dict[save_id] = value
	
	ResourceSaver.save(path, save_game)



func lo(save_name : String):
	
	var namefile = "savefile_" + save_name + ".tres"
	var path = save_folder_path.plus_file(namefile)
	
	if load(path) == null:
		print ("Not loading, save file must be generated")
		var dict : Dictionary
		return dict
	
	var save_game : Resource = load(path)
	print("Loaded: ", save_name)
	
	return save_game.dict












