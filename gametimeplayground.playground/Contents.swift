import Foundation
import SpriteKit
print("hi")

// Let's try some shit out!(input source)
func trial1 (pickNumber: Int){
	
	/// Only as an input source NEVER A GETTER
	typealias StringNode = String
	func clickNode (whichNode: StringNode) -> StringNode {
		/*
		Goal:
		-> Grab node -> Do something with it -> Update node -> Update GameData
		-> Update SaveFile
		
		Function:
		-> Vars -> Funcs -> Logic
		*/
		
			return whichNode
	}
	
	
	// User makes some input...
	let node_choice = clickNode(SharedPrefs.current_game_data.the_nodes.player_node)
	
	print(node_choice)
}


//
//
//



//<#--//--// Execute //--//--#>//

/// Runs the program
let exec = {
	
	
	
	//<#--//--// Initials //--//--#>//
	
	// Loads the view and game
	initials: do {
		
		/*
		->Make vars -> Write 2 blocks -> Logic -> Exec correct block -> return;
		*/
		
		// Arbitrary
		let view = "Only available now"
		
		/// What gets run if this is the first time playing
		let initNewGame = {
			
			// Initialize all the stuff...
			func initalizeNodes(player_name: String) -> Nodes {
				
				// Init the nodesk
				return Nodes(
					player: player_name,
					camera: "Camera Node",
					view: "view"
				)
			}
			
			// Make a new game and save it (also sett
			let new_game = GameData(the_nodes: initalizeNodes("Pakira"))
			SharedPrefs.save_files[0] = new_game
			
			// No longer the first run
			SharedPrefs.first_run = false
		}
		
		/// What gets run if not the first time playing
		let initLoadGame = {
			
			SharedPrefs.loadLatestSave()
		}
		
		// Sort out the above vars and funcs
		Logic: do {
			// If it's the first-time playing the game
			if SharedPrefs.first_run == true {
				
				initNewGame()
			}
			else {
				
				initLoadGame()
			}
		}
		
		// And we're done!
		break initials
	}
	
	//<##>
	main: do {
		
		trial1(1)
	}
	
	
	update: do {
	}
	
}


print("exec:")
print(SharedPrefs.vari)

exec()
