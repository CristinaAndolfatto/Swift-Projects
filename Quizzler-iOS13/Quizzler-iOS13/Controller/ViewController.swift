//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //connect to the question label
    @IBOutlet weak var questionLabel: UILabel!
    //connect to the progress bar
    @IBOutlet weak var progressBar: UIProgressView!
    // connect to the true and false buttons
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    // we create also a label that tracks the scores of the User
    @IBOutlet weak var scoresLabel: UILabel!
    
    
    // create an instance of a quizbrain
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // as soon as the view load, we change the text with the first question
        questionLabel.text = quizBrain.getQuestionText()
        
        // put the progress bar at maximum value
        progressBar.progress = 0.0
        
        // put the score label to the correct test
        scoresLabel.text = "Score: 0"
    }
    
    //we create an action that triggres whether or the true or the false button is pressed, so we use one only function to monitor both buttons
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        // create a variable to store the user response
        let userAnswer = sender.currentTitle!
        // check the true response now using the method inside the quizBrain struct
        //let actualAnswer = quiz[questionNumber].answer
        // as we defined the function in QuizBrain file, the function "checkAnswer" returns a boolean value
        let userGotItRigth = quizBrain.checkAnswer(userAnswer)
        // check the answer
        // if the answer is correct, change button color to green
        if userGotItRigth {
            sender.backgroundColor = UIColor.green
        }
        else { // if the answer is wrong, change button the color to red
            sender.backgroundColor = UIColor.red

        }
        
        // check if we can pass to the next question
        //if questionNumber < quiz.count-1 {
        //    questionNumber += 1
            
        //}
        //else { // return to beginning
        //    questionNumber = 0
        //    }
        
        // Call a timer: after 0.5 secs, call the updateUi function
        // you don't need to memorize it in a variale since it is called once
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)
        
    }
    
    
    // updtae ui question function
    @objc func updateUi() {
        // update the question label
        questionLabel.text = quizBrain.getQuestionText()
        // update the progressbar value
        progressBar.progress = quizBrain.getProgress()
        // update the response score
        scoresLabel.text = "Score: \(quizBrain.getScore())"
        // update the background of the buttons to normal
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        // update the question index
        quizBrain.nextQuestion()
       
    }
    
}
