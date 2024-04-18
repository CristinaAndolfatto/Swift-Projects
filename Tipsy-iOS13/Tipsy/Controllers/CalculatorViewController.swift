//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    // IBOutlets to the main screen
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    // create a new tipsyBrain object with an initial count object initialized as empty
    var currentCount = TipsyBrain(count: Count())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // IBActions for the main screen
    // action to be done when pct button is pressed or changed
    @IBAction func tipChanged(_ sender: UIButton) {
        // reset all the previous selections
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        // make the button remain selected
        sender.isSelected = true
        
        // set the tip perc to the current count object
        let currentTip = sender.titleLabel?.text!
        // extract only the number and exclude % char
        let index = currentTip!.index(currentTip!.endIndex, offsetBy: -2)
        let currentTipSubstring = String(currentTip![...index]) // playground
        
        // set the current tip of the  tipsybrain with the current value
        currentCount.setTipPerc(currentTipPerc: currentTipSubstring)
        
        // dismiss the input text field
        billTextField.endEditing(true)
    }
    
    // action to be done when the split number is changed
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        // update the ui label
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        // set the number of people
        let currentPeopleNumb = String(format: "%.0f", sender.value)
        currentCount.setPeopleNumb(currentPeopleNumb: currentPeopleNumb)
    }
    
    // action to be done when the user wants to calculate the bill
    @IBAction func calculatePressed(_ sender: UIButton) {
        // save the current amount that the user typed in textfield
        let currentAmount = billTextField.text ?? "0.00"
        // set the current amount
        currentCount.setTotalAmount(currentAmount: currentAmount)
        
        // go to the next screen (use the segue with identifier "goToResult")
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    // this method tells the view what to do before going into the second screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if we want to go to the result screen
        if segue.identifier == "goToResult" {
            // set segue.destination equal to the result screen and save it into the destinationVC variable
            let destinationVC = segue.destination as! ResultsViewController
            
            // compute the total per person and pass it to the second result view label
            destinationVC.totPerPerson =
            String(currentCount.getTotalPerPerson(
                countAmount : currentCount.getTotalAmount(),
                tipPerc : currentCount.getTipPerc(), 
                people : currentCount.getPeopleNumb()) ) 
            // pass the number of people
            destinationVC.peopleNumb = currentCount.getPeopleNumb()
            // pass the tip perc
            destinationVC.tipPerc = currentCount.getTipPerc()
            
        }
    }


}

