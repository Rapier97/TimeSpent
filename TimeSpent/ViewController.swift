//
//  ViewController.swift
//  TimeSpent
//
//  Created by Alex Rapier on 15/05/2017.
//  Copyright © 2017 AlexRapier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countdownOutler: UILabel!
    
    var seconds = 600
    var timer = Timer()
    var timeIsRunning = false
    var resumeTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func startButton(_ sender: UIButton) {
        
        if timeIsRunning == false {
        runTimer()
    }
    }

    @IBAction func pauseButton(_ sender: UIButton) {
        
        if self.resumeTapped == false {
            timer.invalidate()
            self.resumeTapped = true
        } else {
            runTimer()
            self.resumeTapped = false
        }
        
    }

    @IBAction func resetButton(_ sender: UIButton) {
        
        timer.invalidate()
        seconds = 60
        countdownOutler.text = timeString(time: TimeInterval(seconds))
        timeIsRunning = false
    }
        
        
    
    
    func runTimer() {
        timeIsRunning = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        timeIsRunning = true
}
    
    func updateTimer() {
        if seconds < 1 {
            countdownOutler.text = "Time's Up!"
        }
        seconds -= 1
        countdownOutler.text = timeString(time: TimeInterval(seconds))
    }
    
    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
}
