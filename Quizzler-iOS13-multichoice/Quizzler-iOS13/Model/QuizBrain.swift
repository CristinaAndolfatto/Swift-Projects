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
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

    ]
    
    // avrà come proprietà anche l'indice della domanda
    // let's create a counter for the question number
    var questionNumber = 0
    
    var score = 0
    
    // let's create a method that tells you if the user answer is correct
    // in ingresso avrà la risposta dell'utente (immagino che il viewController dovrà passarla seguendo il MVC design)
    // in uscita dovrà rispondere al viewController con "sì giusto" o "no sbagliato"
    mutating func checkAnswer(_ userAnswer : String) -> Bool {
        if userAnswer == quiz[questionNumber].trueAnswer {
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
    
    // get the first possible answer
    func getFirstAnswer() -> String {
        return (quiz[questionNumber].answer)[0]
    }
    
    // get the second possible answer
    func getSecondAnswer() -> String {
        return quiz[questionNumber].answer[1]
    }
    
    // get the third possible answer
    func getThirdAnswer() -> String {
        return quiz[questionNumber].answer[2]
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

