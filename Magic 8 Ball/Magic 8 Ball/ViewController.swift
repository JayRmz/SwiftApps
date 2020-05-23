//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Juan Ramírez Blancas on 23/05/20.
//  Copyright © 2020 JuanRamirez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let images = [#imageLiteral(resourceName: "ball1"), #imageLiteral(resourceName: "ball2"),#imageLiteral(resourceName: "ball3"),#imageLiteral(resourceName: "ball4"),#imageLiteral(resourceName: "ball5")]
    
    var imageIndex = 0
    
    @IBOutlet weak var ballImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func randomAnswer(_ sender: Any) {
        changeIndex()
    }
    
    func changeIndex() {
        imageIndex = Int.random(in: 0...4)
        
        ballImage.image = images[imageIndex]
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            changeIndex()
        }
    }
    
}

