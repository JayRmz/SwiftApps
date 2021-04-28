//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
        
    var player: AVAudioPlayer!

    let eggTimes = ["Soft": 300, "Medium":420, "Hard": 720]
    
    var timer = Timer()
    
    var totalTime = 0
    var secondsPassed = 0

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        self.timerLabel.text = "How do you like your eggs?"
        self.secondsPassed = 0
        self.progressBar.progress = 0.0
        
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsPassed < self.totalTime {
                    self.timerLabel.text = String(self.totalTime - self.secondsPassed) + "\n Seconds"
                
                let percentageProgress = Float(self.secondsPassed) / Float(self.totalTime)
                self.progressBar.progress = percentageProgress
                    self.secondsPassed += 1
                } else {
                    self.timerLabel.text = "Done!"
                    self.progressBar.progress = 1
                    Timer.invalidate()
                    
                    self.playSound()
                }
            }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        
        player = try! AVAudioPlayer(contentsOf: url!)

        player.play()
    }
    
}
