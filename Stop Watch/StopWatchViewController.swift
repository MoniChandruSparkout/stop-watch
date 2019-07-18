//
//  StopWatchViewController.swift
//  Stop Watch
//
//  Created by monichandru on 18/07/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import Foundation
import UIKit

class StopWatchViewController: UIViewController
{
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    var timer = Timer()
    var isTimerRunning = false
    var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
    }
    
    @IBAction func resetBtnTapped(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
        counter = 0.0
        
        timerLabel.text = "00:00:00.0"
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
    }
    
    
    @IBAction func pauseBtnTapped(_ sender: Any) {
        resetButton.isEnabled = true
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        isTimerRunning = false
        timer.invalidate()
    }
    
    
    @IBAction func startBtnTapped(_ sender: Any) {
        if !isTimerRunning{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            isTimerRunning = true
            
            resetButton.isEnabled = true
            pauseButton.isEnabled = true
            startButton.isEnabled = false
        }
    }
    
    @objc func runTimer()
    {
        counter += 0.1
        timerLabel.text = "\(counter)"
        
        let flooredCounter = Int(floor(counter))
        let hour = flooredCounter / 3600
        
        let minute = (flooredCounter % 3600) / 60
        
        var minutestring = "\(minute)"
        
        if minute < 10 {
            minutestring = "0\(minute)"
        }
        let second = (flooredCounter % 3600) % 60
        
        var secondString = "\(second)"
        
        if second < 10 {
            secondString = "0\(second)"
        }
        
        let deciSecond = String(format: "%.1f",counter).components(separatedBy: ".").last!
        timerLabel.text = "\(hour):\(minutestring):\(secondString).\(deciSecond)"
    }
}
