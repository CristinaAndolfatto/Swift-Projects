//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    // create a connection to the height label
    @IBOutlet weak var heightLabel: UILabel!
    // connection to the weight label
    @IBOutlet weak var weigthLabel: UILabel!
    // outlet that connects to the height slider
    @IBOutlet weak var heightSlider: UISlider!
    // outlet that connects to the weigth slider
    @IBOutlet weak var weightSlider: UISlider!
    
    // create a bmi value
    //var bmiValue  = "0.0"
    
    // create CalculatorBrain object
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // IBAction for the height slider
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        // print out the current value
        let currentHeigth = String(format: "%.2f", sender.value)
        heightLabel.text = "\(currentHeigth)m"
    }
    
    // IBAction for the weight slider
    @IBAction func weigthSliderChanged(_ sender: UISlider) {
        // print out the current value
        //print(sender.value)
        let currentWeight = String(format: "%.0f", sender.value)
        weigthLabel.text = "\(currentWeight)kg"
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        // heigth slider value
        let heightValue = heightSlider.value
        // weight slider value
        let  weightValue = weightSlider.value
        // Compute the bmi
        //let bmi = weightValue / pow(heightValue, 2)
        //print(bmi)
        
        //bmiValue = String(format: "%.1f", bmi)
        //print(bmiValue)
        
        // we are going to apply MVC: method to return the BMI value given height and weight
        calculatorBrain.calculateBMI(height: heightValue, weight: weightValue)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        // access to the current viewController using self and say to it to present the second view
        //self.present(secondView, animated: true, completion: nil)
    }
    
    
    // this method tells the view what to do before going to the indicated segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination  as! ResultsViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            //print(bmiValue)
            // set the advice property
            destinationVC.adviceLabel = calculatorBrain.getAdvice()
            // set the background color
            destinationVC.color = calculatorBrain.getColor()

        }
    }


}

