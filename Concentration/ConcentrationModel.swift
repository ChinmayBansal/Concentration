//
//  ConcentrationModel.swift
//  Concentration
//
//  Created by Chinmay Bansal on 6/2/22.
//

import Foundation

class Concentration {
    private(set)var cards = [Card]()
    
    private var indexOfOneAneOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
        
    }
    
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index),"Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAneOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAneOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairs: Int) {
        assert(numberOfPairs > 0 ,"Concentration.init(at: \(numberOfPairs)): must have at leat one pair of cards")
        for _ in 1...numberOfPairs {
            let card = Card()
            cards += [card, card]
//            cards.append(card)
//            cards.append(card)
            
        }
    }
}
