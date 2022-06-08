//
//  ViewController.swift
//  Concentration
//
//  Created by Chinmay Bansal on 6/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairs: numberOfPairs)
    // cannot use property observer with lazy variable
    var numberOfPairs: Int {
        get {
            return (cardButton.count+1) / 2
        }
    }
    private(set)var flipCount = 0  {
        didSet {
            countFlipLabel.text = "Flips: \(flipCount)"
        }
    }
    
    
    @IBOutlet private var cardButton: [UIButton]!
    
    @IBOutlet private weak var countFlipLabel: UILabel!
    
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButton.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()

        } else {
            print("chose card not in array")
        }
        
    }
    
    private func updateViewFromModel() {
        for index in cardButton.indices {
            let button = cardButton[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.systemMint
            }
        }
    }
    
    private var emojiChoices = ["🧞‍♂️", "🥷", "👨‍🎤", "🧑‍🎤", "💃", "🧛‍♂️", "🧑‍🍳", "🤴", "👨‍✈️"]
    
    private var emoji = [Int: String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}
//testt

