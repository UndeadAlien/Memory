//
//  gameController.swift
//  MemoryGame
//
//  Created by Connor Hutchinson on 8/26/21.
//

import UIKit

class homeController: UIViewController
{
    // -----------
    // Global Vars
    // -----------
    var MODE: String = "None"

    override func viewDidLoad() {
        super.viewDidLoad()
//        playButton.isEnabled = true // Needs to be false
    }
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func difficulty(_ sender: UISegmentedControl) {
        playButton.isEnabled = true
        switch segmentedControl.selectedSegmentIndex {
        case 0: // Easy Mode
            MODE = "Easy"
            break
        case 1: // Medium Mode
            MODE = "Medium"
            break
        case 2: // Hard Mode
            MODE = "Hard"
            break
        default:
            MODE = "None"
            break
        }

    }
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBAction func clickPlayButton() {
            
        guard let vc = storyboard?.instantiateViewController(identifier: "gameController") as? gameController else {
            return
        }
        
        present(vc, animated: true)
        
    }
}
