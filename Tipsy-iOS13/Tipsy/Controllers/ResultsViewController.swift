//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Cristina Andolfatto on 09/12/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // IBOutlets for the ResultsView
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    // create a total per person variable
    var totPerPerson : String?
    // split people number
    var peopleNumb : String?
    // percentage of tip
    var tipPerc : String?

    
    // IBActions
    // what to do when the recalculate button is pressed
    @IBAction func recalculatePressed(_ sender: UIButton) {
        //  method that dismiss the current UIView and go back to the previous one,  completion nil  so to go back to the prev
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = totPerPerson
        settingsLabel.text = "Split between \(peopleNumb ?? "2") people, with \(tipPerc ?? "10")% tip"

        // Do any additional setup after loading the view.
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
