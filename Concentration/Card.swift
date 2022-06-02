//
//  Card.swift
//  Concentration
//
//  Created by Chinmay Bansal on 6/2/22.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierMaker = 0
    static func getUniqueIdentifier() -> Int {
        identifierMaker += 1
        return identifierMaker
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
