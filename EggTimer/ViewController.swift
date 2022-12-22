//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainProgressBar: UIProgressView!
    
    // initiate required variables
    var timer: Timer = Timer()
    var timerCountdown: Int = 0
    var progression: Float = 0.0
    
    // value are in seconds, eg. 300 seconds is 5 minutes
    let eggHardness: [String: Int] = [
        "Soft": 300,
        "Medium": 420,
        "Hard": 720
    ]

    // function when button is pressed
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        timer.invalidate()
        mainProgressBar.progress = 0.0
        mainLabel.text = "Start!"
        
        // get egg hardness from sender
        let hardnessSelected: String = sender.currentTitle!
        
        // get timerCountdown form dictionary using key from sender.currentTitle
        timerCountdown = eggHardness[hardnessSelected]!
        //calculate progress bar animation
        progression = 1/Float(timerCountdown)
        
        // start timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    // function to update timer and progress bar
    @objc func timerUpdate() {
        mainLabel.text = String(timerCountdown)
        if timerCountdown > 0 {
            print("\(timerCountdown) seconds.")
            mainLabel.text = "\(timerCountdown) seconds to go..."
            mainProgressBar.progress += progression
            timerCountdown -= 1
        } else {
            timer.invalidate()
            mainLabel.text = "Done!"
            mainProgressBar.progress = 1.0
        }
    }
    
}
