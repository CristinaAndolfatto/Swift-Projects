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
    
    // we create the constant times for the different eggs
    //let softTime = 5
    //let mediumTime = 7
    //let hardTime = 12
    
    // we try to define the dictionaries of egg times
    let eggTimesDict = ["Soft": 3, "Medium" : 4, "Hard": 7]
    
    // initialize a timer
    var timer = Timer()
    
    //variables to control the progress bar
    var totalTime = 0
    var secondsPassed = 0
    
    // we create a variable called player and we assigne it a new AV audio player
    var player: AVAudioPlayer?
    
    @IBOutlet weak var timerProgressBar: UIProgressView!
    
    // create an outlet to the title
    @IBOutlet weak var mainTitle: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        // stop the current timer because qwe will create a newer one
        timer.invalidate()
        
        // stop the audio
        if ((player?.isPlaying) != nil) {
            player!.stop()
        }
        
        //reset the seconds passed
        secondsPassed = 0
        
        // here there is the title of the selected button
        let hardness = sender.currentTitle!
        
        // here the correspondent minutes of cooking
        totalTime = eggTimesDict[hardness]!
        
        timerProgressBar.progress = 1.0
        
        // reset the title
        mainTitle.text = "You selected a " + hardness  + " Egg :)"
        
        //schedule a timer of eggCountDown seconds dopo che l'abbiamo stoppato (se era già attivo)
        // questo timer in particolare viene fired every timeInterval second cioè ogni secondo
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        }
        
        //if hardness=="Soft"
        //{print(eggTimesDict["Soft"]!)}
        //else if hardness == "Medium"
        //{print(eggTimesDict["Medium"]!)}
        //else if hardness == "Hard"
        //{print(eggTimesDict["Hard"]!)}
        
        // oppure posso farlo anche con switch/case
    
    @objc func updateTimer() {
        
        if secondsPassed < totalTime {
            
            secondsPassed = secondsPassed + 1
            
            mainTitle.text = String(totalTime - secondsPassed)
            timerProgressBar.progress = 1.0 - ( Float(secondsPassed)/Float(totalTime))
          
        }
        else if secondsPassed == totalTime {
            mainTitle.text = "Egg is ready :)"
            // play the alarm sound
            playAlarmSound()
            // set the progress bar to 0
            timerProgressBar.progress = 0.0
            
            timer.invalidate()

        }
    }
    
    func playAlarmSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()

    }
            
            
    }
    
