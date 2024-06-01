//
//  GHError.swift
//  GitHubViewer
//
//  Created by Cristina Andolfatto on 25/05/24.
//

import Foundation

// create a model for the error using a enum: adopt the Error protocol
enum GHError : Error {
    // if the url is invalid
    case invalidUrl
    // if server is not found or throw error different from status code 200
    case invalidResponse
    // if data parsed are not valid
    case invalidData
    
}
