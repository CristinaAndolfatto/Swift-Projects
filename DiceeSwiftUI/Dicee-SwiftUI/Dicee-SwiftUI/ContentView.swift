//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Cristina Andolfatto on 27/04/24.
//

import SwiftUI

struct ContentView: View {
    
    // define variables for the roll dicee numbers
    @State var leftDiceeNum = 1
    @State var rightDiceeNum =  2
    
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250, alignment: .top)
                Spacer()
                    .frame(height: 30)
                HStack {
                    DiceView(number: leftDiceeNum)
                    DiceView(number: rightDiceeNum)
                }
                .padding(.horizontal)
                Spacer()
                    .frame(height: 160)
                Button(action: {
                    self.leftDiceeNum = Int.random(in: 1...6)
                    self.rightDiceeNum = Int.random(in: 1...6)
                    
                }) {
                    Text("Roll")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.vertical, 6)
                }
                .background(Color(red: 214/255, green: 48/255, blue: 50/255))
                    
            }
            
        }
    }
}

#Preview {
    ContentView()
}

struct DiceView: View {
    // number of the dicee
    let number : Int
    var body: some View {
        Image("dice\(number)")
            .resizable()
            .aspectRatio(1,contentMode: .fit)
            .padding(.all)
    }
}
