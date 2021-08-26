//
//  ViewController.swift
//  MemoryGame
//
//  Created by Connor Hutchinson on 8/24/21.
//

// Controller Class
// How your model is presented to the User

// Themes
// - Must have enough emojis for the number of cards / 2
// #cards / 2 = #emojis needed

import UIKit

class gameController: UIViewController
{
    // ----------------
    // Global Variables
    // ----------------
    
    var result: Result?
    lazy var game = Memory(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    lazy var gameTheme: [String] = []
    
//    var flipCount = 0 {
//        didSet {
//            gameCounter.text = "\(flipCount)"
//        }
//    }
    
    
    // --------------------------
    // --------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSON()
        gameTheme = returnTheme()
        
        print("Current Theme: \(gameTheme)")
    }
    // --------------------------
    // --------------------------
    
    
    // --------------------
    // @IBAction – Function
    // --------------------
    
    @IBAction func touchСard(_ sender: UIButton) {
//        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Card not in cardButtons")
        }
    }
    
    // ******************
    // Currently not used
    // ******************
    @IBAction func newGame(_ sender: UIButton) {
        // Create new game
        game = Memory(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        
        // Get new theme
        gameTheme = returnTheme()
        
        // Update the model
        updateViewFromModel()
        
        // Reset flipCount
//        flipCount = 0
        
        // Reset Game Counter
//        gameCounter.text = "\(flipCount)"
    }
    
    // --------------------
    // @IBAction – Variable
    // --------------------
    
    // --------------------
    // @IBOutlet – Function
    // --------------------
    
    // --------------------
    // @IBOutlet – Variable
    // --------------------
    
    @IBOutlet var cardButtons: [UIButton]!
    
    // ---------
    // FUNCTIONS
    // ---------
    
    // Refresh the model to update the view
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]

            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
            }
        }
    }
    
    // JSON file with Emoji Themes – parsing function
    private func parseJSON() {
        guard let path = Bundle.main.path(forResource: "themes", ofType:  "json") else {
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from: jsonData)
        }
        catch {
            print("Error: \(error)")
        }
    }
    
    // Create dictionary
    var emoji = [Int:String]()
    
    // Num of Themes
    func numOfResults() -> Int {
        return result?.data.count ?? 0
    }
    
    // Get a random theme
    func returnTheme() -> [String] {
        let rand = Int(arc4random_uniform(UInt32(numOfResults())))
        let emojiList = result?.data[rand].emojis
        let name = result?.data[rand].theme
        
        return emojiList ?? ["?"]
    }
    
    // Putting emoji on card
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil {
            // Card has no identifier
            let rand = Int(arc4random_uniform(UInt32(self.gameTheme.count)))
            emoji[card.identifier] = self.gameTheme.remove(at: rand)
        }
        
        print("After remove: \(self.gameTheme)")
        
        return emoji[card.identifier] ?? "?"
    }
    
    
}
