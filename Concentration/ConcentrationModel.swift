//
//  ConcentrationModel.swift
//  Concentration
//
//  Created by Chinmay Bansal on 6/2/22.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairs: Int) {
        for _ in 1...numberOfPairs {
            let card = Card()
            cards += [card, card]
//            cards.append(card)
//            cards.append(card)
            
        }
    }
}
