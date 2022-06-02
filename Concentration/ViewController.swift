//
//  ViewController.swift
//  Concentration
//
//  Created by Chinmay Bansal on 6/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0  {
        didSet {
            countFlipLabel.text = "Flips: \(flipCount)"
        }
    }
    
    
    @IBOutlet var cardButton: [UIButton]!
    
    @IBOutlet weak var countFlipLabel: UILabel!
    
    var emojiChoices = ["🧞‍♂️", "🥷", "🧞‍♂️", "🥷"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButton.firstIndex(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)

        } else {
            print("chose card not in array")
        }
        
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = UIColor.red
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = UIColor.systemPurple
        }
    }

}

