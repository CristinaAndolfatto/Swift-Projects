//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Cristina Andolfatto on 01/05/24.
//

import Foundation
import SwiftUI

class NetworkManager : ObservableObject {
    
    // create a state object so when data are updated, aslo the observed object in the main view is called and the UI redrawn
    // so initialize this posts as an array of posts that will be set as data decoded from networking
    @Published var posts = [Post]()
    
    // this class has a method fetchData to fetch API data
    func fetchData() {
        // API url for retrievien the front page content of the site
        if let url = URL(string:"http://hn.algolia.com/api/v1/search?tags=front_page")
        {
            // if we are able to create the url,create a URL session  with default configuration
            let session = URLSession(configuration: .default)
            // create a task
            let task = session.dataTask(
                with: url) { data, response, error in
                    // if there are no errors
                    if error==nil {
                        // we have the JSON, so decode the JSON data from networking session
                        let decoder = JSONDecoder()
                        // since data is an optional, we have to check if data are not nil
                        if let safeData = data {
                            do  {
                                // try to save the decoded results into a results  variable
                                let  results = try decoder.decode(Results.self, from: safeData)
                                // set the posts variable of the networkManageras the results hints which is an array of posts
                                // N.B. we have to call the dispatcqueue in order to publish on the main thread
                                DispatchQueue.main.async {
                                    self.posts = results.hits
                                }
                            } catch {
                                print(error)
                            }
                        }
                        
                    }
                }
            // start the networking task
            task.resume()
            
        }
        
    }
    
}
