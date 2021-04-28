//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        print("I got presswed by: \(String(describing: sender.currentTitle!))")
        playSound(note: sender.currentTitle!)
    }

    func playSound(note: String = "C") {
        let url = Bundle.main.url(forResource: note, withExtension: "wav")
        
        player = try! AVAudioPlayer(contentsOf: url!)

        player.play()
    }
}

