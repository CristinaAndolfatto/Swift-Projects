//
//  ContentView.swift
//  BusinessCard
//
//  Created by Cristina Andolfatto on 25/04/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
        var body: some View {
            ZStack {
                Color(red: 162/255, green: 155/255, blue: 254/255)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image("profileAvatar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 200)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color(.black), lineWidth: 5))
                    HStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                        Text("Cristina Andolfatto")
                            .font(Font.custom("Pacifico-Regular", size: 30))
                            .foregroundColor(.black)
                        .fontWeight(.bold)
                    }
                    Text("iOS Developer")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Divider()
                    ProfileDescription(info: "+39 3463289540", image: "phone.circle")
                    ProfileDescription(info: " andolfattocristina@gmail.com", image: "envelope")

                }
                
            }
        }

}


#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
