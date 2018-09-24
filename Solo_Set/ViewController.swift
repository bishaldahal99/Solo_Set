//
//  ViewController.swift
//  Solo_Set
//
//  Created by Bishal Dahal on 18/9/18.
//  Copyright © 2018 Bishal Dahal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateButtons()
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var dealMoreButton: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    
    
    // The code in this function randomly deals 3 cards. And when the deck is empty, the button disappears.
    @IBAction func dealCards(_ sender: UIButton) {
        if !randomArray.isEmpty {
            for _ in 0..<3 {
                let randomIndex = randomArray.randomElement()!
                cardButtons[randomIndex].setTitle("B", for: UIControl.State.normal)
                cardButtons[randomIndex].isHidden = false
                if let randomArrayIndex = randomArray.firstIndex(of: randomIndex) {
                    randomArray.remove(at: randomArrayIndex)
                }
            }
            if randomArray.isEmpty {
                dealMoreButton.isHidden = true
            }
        }
    }
    
    
    // 'randomArray' is created to have a track of shown and unshown buttons
    var randomArray = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]
    func updateButtons() {
        var count = 0
        
        for index in cardButtons.indices {
            cardButtons[index].layer.cornerRadius = 5
//            cardButtons[index].isHidden = true
            
            if count < 12 {
                let randomIndex = randomArray.randomElement()!
                cardButtons[randomIndex].setTitle("", for: UIControl.State.normal)
                cardButtons[randomIndex].isHidden = false
                if let randomArrayIndex = randomArray.firstIndex(of: randomIndex) {
                    randomArray.remove(at: randomArrayIndex)
                }
                count += 1
            }
            

        }
        dealMoreButton.layer.cornerRadius = 5
        newGameButton.layer.cornerRadius = 5
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

