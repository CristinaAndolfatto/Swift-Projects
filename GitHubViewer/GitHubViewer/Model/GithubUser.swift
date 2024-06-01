//
//  GithubUser.swift
//  GitHubViewer
//
//  Created by Cristina Andolfatto on 25/05/24.
//

import Foundation

struct GithubUser : Codable {
    // user name
    let login : String
    
    // user avatar
    let avatarUrl : String
    
    // user bio
    let bio : String
}


// MARK: section that define the method to get the user data and parse from GET REST method a GithubUser

// Get the user from Github  API: the function has different keywords:
// 1- async: to declare the function asynchrounous
// 2- throws: to declare that the function can throw errors
func getUser(username : String) async throws -> GithubUser {
    // API get user end point
    let endpoint = "https://api.github.com/users/\(username)"
    
    // create the url object for the URL session
    guard let url = URL(string: endpoint) else {
        // if url not available, throw an error
        // the error is of type GHError, which is an enum we declared as adopting the protocol Error
        throw GHError.invalidUrl
    }
    
    // try to get the data and the response
    let (data, response) = try await URLSession.shared.data(from: url)
    
    // first we want to check the response, which represents the server code response
    // we check if the response is equal to 200 (ok), otherwise we throw an error
    guard let response = response as? HTTPURLResponse, response.statusCode==200 else {
        // throw an error: general invalid server response
        throw GHError.invalidResponse
    }
    
    // now that both response and data are invalid, we want to try to decode the data received and transform if into Github User class
    do {
        // create a JSON decoder
        let decoder = JSONDecoder()
        // so to avoid camelCase/snakeCase errorsfor JSON/Model different parameters names
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        // try to decode the parsed data and trasform them into GitHubUser model
        return try decoder.decode(GithubUser.self, from: data)
    }
    catch
    {
        // throw an invalid data error
        throw GHError.invalidData
    }
            
}
