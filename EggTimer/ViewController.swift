//
//  ViewController.swift
//  EggTimer
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 5,"Medium":7, "Hard":12]
    var counter = 0
    var timer = Timer()
    var secondsPassed = 0
    var player: AVAudioPlayer!
    @IBOutlet weak var frontMessages: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
        
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        counter = eggTimes[hardness]! // * 60
        progressBar.progress = 0.0
        secondsPassed = 0
        frontMessages.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update(){
        if secondsPassed < counter {
            
            secondsPassed += 1
            
            progressBar.progress = Float(secondsPassed) / Float(counter)
            

        } else {
            timer.invalidate()
            playSound(soundName: "alarm_sound")
            frontMessages.text = "DONE!!!"
        }
    }
    
    func playSound(soundName: String){
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

