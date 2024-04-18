//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Cristina Andolfatto on 04/11/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text : String
    let answer : String
    
    // init method
    init(q:String, a:String) {
        self.text = q
        self.answer = a
    }
}
