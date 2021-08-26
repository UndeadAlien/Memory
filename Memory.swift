//
//  Memory.swift
//  MemoryGame
//
//  Created by Connor Hutchinson on 8/25/21.
//

// Model
// What your application is (but not how it is displayed) 

import Foundation

class Memory
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // Check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // Either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    // 0..<[countable_range]
    // 0...including the last number
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            // cards.append(card)
            cards += [card, card]
        }
        
        // Shuffle cards
        
        print("Shuffling Cards...")
        
        var copyCards = self.cards
        
        var last = copyCards.count-1
        
        while(last>0) {
            let rand = Int.random(in: 0..<last)
            
            copyCards.swapAt(last, rand)
            last -= 1
        }
        
        cards = copyCards
    }
}
