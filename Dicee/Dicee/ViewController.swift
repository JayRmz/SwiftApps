//
//  ViewController.swift
//  Dicee
//
//  Created by Juan Ramírez Blancas on 21/05/20.
//  Copyright © 2020 Juan Ramirez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    Outlets
    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    
//    Variables
    let arrayOfImages = [ #imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix") ]
    var leftDiceNumber = 0
    var rightDiceNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }

    @IBAction func rollDice(_ sender: UIButton) {
        changeImages()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            changeImages()
        }
    }
    
    func changeImages()  {
        leftDiceNumber = Int.random(in: 0...5)
        rightDiceNumber = Int.random(in: 0...5)
        
        diceImageViewOne.image = arrayOfImages[leftDiceNumber]
        diceImageViewTwo.image = arrayOfImages[rightDiceNumber]
    }
    
    
}

