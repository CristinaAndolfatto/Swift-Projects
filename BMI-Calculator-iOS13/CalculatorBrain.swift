//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Cristina Andolfatto on 03/12/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    // calculator brain properties -> this is optional because we are not sure that there be
    // we will use the bmi model saved and defined in BMI.swift file (it is a struct)
    var bmi : BMI?
    
    // calculator brain functions
    // return the bmi value
    func getBMIValue() -> String {
        // we will use the coalescing operator: so, if bmi != nil -> bmiTo1DecimalPlace = bmi, ELSE bmiTo1DecimalPlace = 0.0
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        
        return bmiTo1DecimalPlace
        
        // or you can also do like this
        /*
            if let safeBMI = bmi 
            {
                let bmiTo1DecimalPlace = String(format: "%1.f", safeBMI)
                return bmiTo1DecimalPlace
            }
            else
            {
                return "0.0"
            }
         */
        
    }
    
    // return the advice label associated with the bmi -> we will return or the advice or the default just eat advice if the bmi object = nil
    // we are using the coalescing operator technique
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice, just eat :) "
    }
    
    // return the color associated with the bmi -> we will return or the color or the default white color if the bmi object = nil
    // we are using the coalescing operator technique

    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
    
    // calculate the bmi value given height and weight
    mutating func calculateBMI(height : Float, weight : Float) {
        // create a temporal variable
        let bmiValue = weight / pow(height, 2)
        /*
        // bmi categories from National Centers
        Underweight = < 18.5
        Normal Weigth = 18.5-24.9
        Overweight = >25
          */
        if bmiValue < 18.5{
            // set the bmi object with the bmiValue and correct advice and color
            bmi = BMI(value: bmiValue, advice: "Eat more snacks :)", color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1) )
        }
        else if 19...24.9 ~= bmiValue {
            // set the bmi object with the bmiValue and correct advice and color
            bmi = BMI(value: bmiValue, advice: "You are in great shape! :)", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) )
        }
        else if bmiValue>24.9 {
            // set the bmi object with the bmiValue and correct advice and color
            bmi = BMI(value: bmiValue, advice: "Eat less snacks :(", color: #colorLiteral(red: 0.48117733, green: 0.04765702039, blue: 0, alpha: 1))
        }
        
    
    }
    
}
