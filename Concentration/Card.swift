//
//  Card.swift
//  Concentration
//
//  Created by Chinmay Bansal on 6/2/22.
//

import Foundation

struct Card: Hashable {
    
    //var hashValue: Int { return identifier}
    func hash(into hasher: inout Hasher) -> Int {
        return identifier
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierMaker = 0
    private static func getUniqueIdentifier() -> Int {
        identifierMaker += 1
        return identifierMaker
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
