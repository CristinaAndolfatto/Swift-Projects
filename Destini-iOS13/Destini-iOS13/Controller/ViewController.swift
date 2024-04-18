//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    // create an IBAction that tells me which button was pressed
    @IBAction func choiceMade(_ sender: UIButton) {
        
        // choice made by the user
        let userChoice = sender.currentTitle!
        
        // update the story
        storyBrain.newStory(userChoice: userChoice)
        
        // update the title and the choices
        updateUi()
        
    }
    
    func updateUi() {
        // update the story label
        storyLabel.text = storyBrain.getStoryTitle()
        
        // update the choice buttons
        choice1Button.setTitle(storyBrain.getChoiceOne(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoiceTwo(), for: .normal)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // reset the story number
        storyBrain.storyNumb = 0
        
        // update the story label
        storyLabel.text = storyBrain.getStoryTitle()
        
        // update the choice buttons
        choice1Button.setTitle(storyBrain.getChoiceOne(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoiceTwo(), for: .normal)

    }


}

