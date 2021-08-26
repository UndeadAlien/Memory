//
//  Models.swift
//  MemoryGame
//
//  Created by Connor Hutchinson on 8/26/21.
//

import Foundation

struct Result: Codable {
    let data: [ResultItem]

}

struct ResultItem: Codable {
    let theme: String
    let emojis: [String]
}
