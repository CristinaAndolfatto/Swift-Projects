//
//  ProfileDescription.swift
//  BusinessCard
//
//  Created by Cristina Andolfatto on 25/04/24.
//

import SwiftUI

struct ProfileDescription: View {
    // create some prop so to reuse the view
    let info : String
    let image : String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(height: 50)
            .padding(.all)
            .foregroundColor(Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.85)))
            .overlay(HStack {
                Image(systemName: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
                Text(info)
                    .font(Font.custom("Pacifico-Regular", size: 20))
                    .foregroundColor(.white)
                    .fontWeight(.light)
            })
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

