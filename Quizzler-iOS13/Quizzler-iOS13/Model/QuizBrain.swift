//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Cristina Andolfatto on 05/11/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    // let create an array of questions
    // ora quiz è una proprietà di QuizBrain e non serve inizializzarla perchè è dichiarata costante -> posso infatti in questo modo leggerla e non posso modificarla
    let quiz = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    // avrà come proprietà anche l'indice della domanda
    // let's create a counter for the question number
    var questionNumber = 0
    
    var score = 0
    
    // let's create a method that tells you if the user answer is correct
    // in ingresso avrà la risposta dell'utente (immagino che il viewController dovrà passarla seguendo il MVC design)
    // in uscita dovrà rispondere al viewController con "sì giusto" o "no sbagliato"
    mutating func checkAnswer(_ userAnswer : String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            // got the response right
            //update the score
            score = score + 1
            return true
        } else {
            // got the response wrong
            return false
        }
        
    }
    
    // we create a function that track the user score
    func getScore() -> Int {
        return score
    }
    
    
    // we create a function that returns the question text
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    // this function return the % of completion of the quiz
    func getProgress() -> Float {
        return Float(questionNumber+1)/Float(quiz.count)
    }
    
    // function that updates the questionNumber
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber = questionNumber + 1
        }
        else {
            // reset the question number
            questionNumber = 0
            //reset the score
            score = 0
        }
    }
    
    
}

