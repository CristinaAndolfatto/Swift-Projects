//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Cristina Andolfatto on 09/04/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

// here we have all the constants for our app
struct Constants {
    static let appName = "⚡️ FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
    
}
