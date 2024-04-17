//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by Cristina Andolfatto on 26/11/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController  : UIViewController {
    
    // create the bmi property
    var bmi : String = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // modify background color
        view.backgroundColor = .red
        
        // create a label programmaticvally
        let label = UILabel()
        label.text = bmi
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        view.addSubview(label)
        
    }
    
}
