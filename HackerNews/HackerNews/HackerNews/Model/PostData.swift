//
//  PostData.swift
//  HackerNews
//
//  Created by Cristina Andolfatto on 01/05/24.
//

import Foundation

// datamodel for JSON results
struct Results : Decodable {
    // this is the array of posts in the firstpage from JSON file
    let hits : [Post]
}

// define the structure of a single post: decodable for  the JSON decoderand Identifiable for the List in the main view
struct Post : Decodable, Identifiable {
    let objectID : String
    let title : String
    let points : Int
    let url : String?
    
    // create the  ID for the Identifiable protocol from objectID prop of the JSON
    var id : String {
        return objectID
    }
    
}
