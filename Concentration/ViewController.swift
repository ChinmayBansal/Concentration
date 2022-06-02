//
//  ViewController.swift
//  Concentration
//
//  Created by Chinmay Bansal on 6/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairs: (cardButton.count + 1) / 2)
    // cannot use property observer with lazy variable
    
    var flipCount = 0  {
        didSet {
            countFlipLabel.text = "Flips: \(flipCount)"
        }
    }
    
    
    @IBOutlet var cardButton: [UIButton]!
    
    @IBOutlet weak var countFlipLabel: UILabel!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButton.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()

        } else {
            print("chose card not in array")
        }
        
    }
    
    func updateViewFromModel() {
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
    
    var emojiChoices = ["🧞‍♂️", "🥷", "👨‍🎤", "🧑‍🎤", "💃", "🧛‍♂️", "🧑‍🍳", "🤴", "👨‍✈️"]
    
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String {
        return emoji[card.identifier]! ?? "?"
    }
}

