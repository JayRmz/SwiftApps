//
//  WelcomeViewController.swift
//  Flash Chat iOS14
//
//  Created by Jay Ramirez on 21/10/2021.
//  Copyright © 2021 Jay Ramirez. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = ""
        var charIndex = 0.0
        let titleText = "⚡️FlashChat"
        
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false, block: { (timer) in
                self.titleLabel.text?.append(letter)
                
            })
            charIndex += 1
        }
       
    }
    

}
