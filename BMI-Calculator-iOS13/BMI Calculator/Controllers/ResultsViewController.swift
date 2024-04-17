//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by Cristina Andolfatto on 28/11/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // create the bmi variable
    var bmiValue : String?
    // bmi advice
    var adviceLabel : String?
    // bmi backgroudn color
    var color : UIColor?
    
    // link to the ui elements
    @IBOutlet weak var bmiResult: UILabel!
    @IBOutlet weak var adviceLabelView: UILabel!
    @IBOutlet weak var resultBackground: UIImageView!
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        bmiResult.text = bmiValue
        adviceLabelView.text = adviceLabel
        view.backgroundColor = color
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        
        //  method that dismiss the current UIView and go back to the previous one,  completion nil  so to go back to the prev
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
