//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //create an outlet to the imageview in the storyboard (click+control, drag and drop)
    @IBOutlet weak var diceImageViewOne: UIImageView!
    
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    
    // creiamo una variable per indice della prima immagine
    var leftDiceNumber = 1
    
    // creiamo una variable per indice della seconda immagine
    var rightDiceNumber = 5
    
    
    //override func viewDidLoad() {
        // this function means "when the view is loaded"
      //  super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
        //as soon as the view is loaded up, I want to change my image
        diceImageViewOne.image = UIImage(imageLiteralResourceName: "DiceFive")
        // we want to change the transparency, so the alpha to 0.5
        // diceImageViewOne.alpha = 0.5
        
        // and we wanto to change the second image to the dice one
        // N.B. WHO.WHAT = VALUE
        diceImageViewTwo.image = UIImage(imageLiteralResourceName: "DiceOne")
         */
        
    //}
    
    // for user interaction, we exit from the load of the view
    // N.B. questo giro ci serve una Interface Builder action, che è una funzione che viene chiamata quando il sender  UIButton viene premuto
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        // questo fa un print nella console di debug
        // print("Button pressed")
        
        /*
        // CHALLENGE: when the button is pressed, change the images
        diceImageViewOne.image = UIImage(imageLiteralResourceName: "DiceFour")
        diceImageViewTwo.image = UIImage(imageLiteralResourceName: "DiceFour")
         */
        // per usare imageLiteral, bisogna scrivere #imageLiteral()
        // poi per accedere a indice array, basta che ne aggiungo doppia parentesi quadra dopo
        // qui noi creiamo un numero random tra 0 a 6 e poi quando premiamo bottone ne prende una a caso
        
        let diceArray = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix") ]
        
        
        diceImageViewOne.image = diceArray[Int.random(in: 0...5)]
        // n.b. per accedere a item di un array si fa
        // [item1, item2, ... etc][index]
        diceImageViewTwo.image = diceArray [Int.random(in: 0...5)]
        
        // increase image id on left
        // leftDiceNumber += 1
        
        // decrease image id on rigth
        // rightDiceNumber -= 1
        
        // now we want to create some random numbers
        // we can do in this way, in: 1...10 represents a range of int between 1 and 10
        // var diceIndex = Int.random(in: 0...5)
        // Int.random(in lower...upper)
        
        // posso anche non includere upper bound
        // Int.random(in: lower..< upper)
        // se voglio dei double posso usare Float.random(in: lower...upper)
        
        
    }
    

}

