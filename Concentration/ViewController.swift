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
            updateFlipCount()
        }
    }
    
    private func updateFlipCount() {
        let attributes: [NSAttributedString.Key:Any] = [
            .strokeWidth : 5.0,
            .strokeColor: UIColor.systemMint
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        countFlipLabel.attributedText = attributedString
    }
    
    
    @IBOutlet private var cardButton: [UIButton]!
    
    @IBOutlet private weak var countFlipLabel: UILabel! {
        didSet {
            updateFlipCount()
        }
    }
    
    
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
    
    //private var emojiChoices = ["🧞‍♂️", "🥷", "👨‍🎤", "🧑‍🎤", "💃", "🧛‍♂️", "🧑‍🍳", "🤴", "👨‍✈️"]
    private var emojiChoices = "🧞‍♂️🥷👨‍🎤🧑‍🎤💃🧛‍♂️🧑‍🍳🤴👨‍✈️"
    
    private var emoji = [Card: String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            
        
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}

