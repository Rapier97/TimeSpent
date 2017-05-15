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
    
    var seconds = 0
    var timer = Timer()
    var timeIsRunning = false
    var resumeTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func startButton(_ sender: UIButton) {
        runTimer()
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
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
}
    
    func updateTimer() {
        seconds += 1
        countdownOutler.text = "\(seconds)"
    }
}
