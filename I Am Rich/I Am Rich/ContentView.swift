//
//  ContentView.swift
//  I Am Rich
//
//  Created by Cristina Andolfatto on 23/04/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext)
    private var viewContext
    var body : some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("I Am Rich :)")
                    .font(.system(size: 40))
                    .bold()
                .foregroundColor(.white)
                Image("diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200,height: 200,alignment: .center)
            }
        }
        
    }
    
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
