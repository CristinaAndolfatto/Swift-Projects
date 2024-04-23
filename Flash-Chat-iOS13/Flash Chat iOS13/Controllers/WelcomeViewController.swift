//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    // hide navigation abr wjen entering
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    // show navigation bar in next views
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleText = Constants.appName
        titleLabel.text = titleText
        // after three letters, pause animation
        Timer.scheduledTimer(withTimeInterval: 0.1*5, repeats: false) {
            timer in
            self.titleLabel.pauseTyping() //this will pause the typing animation
        }
        // then again, to simulate the typing
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {
            timer in
            self.titleLabel.continueTyping() //this will restore the typing animation
            // accelerate a little bit the typing in the end
            self.titleLabel.charInterval = 0.02
        }
        
        /*
         // char index  to schedule the timer at intervarls of 0.1, 0.2, etc...
         var charIdx = 0
         for letter in titleText {
         Timer.scheduledTimer(withTimeInterval: 0.1*Double(charIdx), repeats: false) {
         timer in
         self.titleLabel.text?.removeLast()
         self.titleLabel.text?.append(letter)
         self.titleLabel.text?.append("|")
         }
         // increase charindex
         charIdx+=1
         } */
    }
    

}
