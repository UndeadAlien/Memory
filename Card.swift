//
//  Card.swift
//  MemoryGame
//
//  Created by Connor Hutchinson on 8/25/21.
//

// View
// Your controllers minion



// Classes
//
// #1 - Classes has inheritance
// #2 - Classes are reference type - lives in the heap – passes pointers to it.
// #3 - When initialized classes receive a free 'init' if all vars are initilized

// Structs
//
// #1 - Structs has no inheritance
// #2 - Structs are value types
// #3 - Structs initialize all vars 

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return Card.identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
