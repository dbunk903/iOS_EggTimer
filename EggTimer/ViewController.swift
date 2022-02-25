//
//  ViewController.swift
//  EggTimer
//

import UIKit

class ViewController: UIViewController {
    //let softTime = 5
    //let mediumTime = 7
    //let hardTime = 12
    let eggTimes = ["Soft": 5,"Medium":7, "Hard":12]
    var counter = 0
    var timer = Timer()
    @IBAction func hardnessSelected(_ sender: UIButton) {

        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        counter = eggTimes[hardness]! * 60
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        // we never stopped it.
    }
    @objc func update(){
        if counter > 0 {
            print("\(String(describing:counter)) until your eggs are cooked")
            counter-=1
        }
    }
}

