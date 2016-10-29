import Foundation

/*

- no prams no return = named closure
- funcs must return or have a pram

- VFL order: VeryFunkyLogic

- all things in the do block
- one space after every {
- comment block to explain

- logic = do block
- comes before break named

- 3 spaces in  between marks
- 1 space under
- comment followed


*/



//<#--//--// Shared Prefs //--//--#>//

/// Holds save game stuff
public struct SharedPrefs {
	static let vari = "hi"
	
	
	
	//<#--//--// Random Stuff //--//--#>//
	
	/// For initial stuff
	static var first_run = true
	
	
	
	//<#--//--// Save Management //--//--#>//
	
	/// updated automatically on saveGame(); holds the GD() object
	static var current_game_data = GameData(the_nodes: Nodes())
	
	/// updated automatically on saveGame()
	static var backup_saves = [GameData(the_nodes: Nodes())]
	
	/// Saved GameData (updates cgd and bs)
	static var save_files = [GameData(the_nodes: Nodes())] {
		
		// Backup our current file
		willSet {
			
			backup_saves.append(save_files.last!)
		}
		
		// Update our current game data object
		didSet {
			
			current_game_data = save_files.last!
		}
	}
	
	/// Loads save_file.last into cgd
	static func loadLatestSave() {
		
		current_game_data = save_files.last!
	}
	
	/// Appends sf to pram
	static func saveGame(data_to_save: GameData) {
		
		save_files.append(data_to_save)
	}
}



//<#--//--// Game Data //--//--#>//

/// Holds all of our everything
public struct GameData {
	
	let the_nodes: Nodes
}



//<#--//--// Nodes //--//--#>//

/// Holds all of our nodes
public struct Nodes {
	
	let
	player_node: String,
	camera_node: String,
	view_node: String
	
	init(player: String, camera: String, view: String){
		player_node = player
		camera_node = camera
		view_node = view
	}
	
	init() {
		player_node = ""
		camera_node = ""
		view_node = ""
	}
	
}
