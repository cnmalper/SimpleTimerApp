//
//  ViewController.swift
//  TimerApp
//
//  Created by Alper Canımoğlu on 22.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startField: UITextField!
    
    var timer = Timer()
    var counter = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func stopButton(_ sender: Any) {
        timer.invalidate()
        timerLabel.text = "You clicked the button. Time's over."
        counter = 0
        startField.text = ""
        
    }
    
    @IBAction func startButton(_ sender: Any) {
        if Int(startField.text!) != nil {
            self.counter = Int(startField.text!)!
            timerLabel.text = "Timer: \(self.counter)"
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        } else {
            let alert = UIAlertController(title: "Error!", message: "You need to type an Integer number.", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            startField.text = ""
        }
   
   }
    
    @objc func timerFunc() {
        counter -= 1
        timerLabel.text = "Timer: \(counter)"
        

        
        if counter == 0 {
            //print(counter)
            timer.invalidate()
            timerLabel.text = "Time's over."
            startField.text = ""
        }
        
    }
    
}
