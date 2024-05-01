//
//  ContentView.swift
//  HackerNews
//
//  Created by Cristina Andolfatto on 28/04/24.
//

import SwiftUI

struct ContentView: View {
    
    // create an  observable object from the networkManager class -> when the @Published property changes, this object will be modified and the ContentView redrawn
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationStack {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url), label:   {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                    
                })
                
            }
            .navigationTitle("HackerNews")
        }
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
        
    }
}

#Preview {
    ContentView()
}

