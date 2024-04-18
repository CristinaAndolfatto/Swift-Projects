//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Cristina Andolfatto on 10/12/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct TipsyBrain {
    
    // this is the brain that computes the total amount per person given a certain Count() object
    var count : Count?
    
    // init method
    init(count: Count? = nil) {
        self.count = count
    }
    
    // return the count total amount
    func getTotalAmount() -> String {
        return count?.totalAmount ?? "0.0"
    }
    
    // return the count percentage tip
    func getTipPerc() -> String {
        return count?.tipPerc ?? "0"
    }
    
    // return the cout number of people
    func getPeopleNumb() -> String {
        return count?.numbPeople ?? "0"
    }
    
    // set the total amount
    mutating func setTotalAmount(currentAmount : String) {
        count?.totalAmount = currentAmount 
    }
    
    // set the total tip perc
    mutating func setTipPerc(currentTipPerc : String) {
        count?.tipPerc = currentTipPerc
    }
    
    // set the total number of people
    mutating func setPeopleNumb(currentPeopleNumb : String) {
        count?.numbPeople = currentPeopleNumb
    }
    
    /* return total amount per person
     INPUT: - totalAmount
            - tip percentage
            - number of people
    */
    func getTotalPerPerson(countAmount : String, tipPerc : String, people : String) -> String {
        // convert Strings to Double
        let totAmountDouble = Double(countAmount) ?? 0.00
        let tipPercDouble = Double(tipPerc) ?? 0.0
        let peopleNumb = Double(people) ?? 2.0
        
        // compute the percentage to be added
        let tipAdd = (totAmountDouble * tipPercDouble) / 100
        // compute the total per person
        let totPerPerson = (totAmountDouble + tipAdd)/peopleNumb
        // convert totPerPerson to String
        let totPerPersonString = String(format: "%.2f", totPerPerson)
        
        return totPerPersonString
    }
    
    
}
