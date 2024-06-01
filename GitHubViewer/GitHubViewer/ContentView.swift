//
//  ContentView.swift
//  GitHubViewer
//
//  Created by Cristina Andolfatto on 25/05/24.
//

import SwiftUI

struct ContentView: View {
    
    // create a state var: cna be read and wrote by SwiftUI; as soon as the value of the var is setted, the UI is rebuilt again
    // in this cas it is an optional Github user because the method is async
    @State var  user : GithubUser?
    
    var title : String = "Username placeholder"
    var description : String = "Github bio placeholder"
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
            VStack (spacing: 20) {
                // get the async image
                AsyncImage(url: URL(string: user?.avatarUrl ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                        .clipShape(Circle())
                } placeholder: {
                    Circle()
                        .foregroundColor(.gray)
                        .hoverEffect(.highlight)
                        .frame(width: 200, height: 200, alignment: .center)
                }
                HStack (spacing: 10) {
                        Image("GithubLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                            .foregroundColor(.white)

                    Text(user?.login ?? title)
                        .bold()
                        .font(.custom("title",size: 30))
                    .foregroundStyle(.white)
                }
                Text(user?.bio ?? description)
                    .font(.custom("title2", size: 15))
                    .foregroundStyle(.white)
                // Add a spacer that takes all the available space to bring the content up
                Spacer()
            }
            .padding()
            .task {
                // we want to get the user data as soon as the App starts into an async way
                
                do {
                    user = try await getUser(username: "CristinaAndolfatto")
                } catch 
                    GHError.invalidUrl{
                    // catch the errors thrown by the getUser method we defined: invalidUrl
                    print("Invalid URL")
                }
                catch GHError.invalidResponse {
                    // catch the errors thrown by the getUser method we defined: invalidResponse
                    print("Invalid Response")
                }
                catch GHError.invalidData {
                    // catch the errors thrown by the getUser method we defined: invalidData
                    print("Invalid Data")
                }
                catch {
                    // catch other types of errors
                    print("Unexpected error")
                }
                
                
        }
        }
    }
}

#Preview {
    ContentView()
}
