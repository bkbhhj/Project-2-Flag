//
//  ContentView.swift
//  Project 2 Flag
//
//  Created by Павел Тимофеев on 22.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showing = false
    @State private var scoreTitle = ""
    @State private    var score = 0
    
    @State private   var countries = [ "Estonia", "France", "Germany",
    "Ireland", "Italy", "Nigeria", "Poland", "Russia","Spain", "UK", "US"                      ]
    @State private   var correctAnswer = Int.random(in: 0...2)
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .blue,.red]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
        VStack(spacing: 30) {
        VStack {
            Text("Tap to the flag").foregroundColor(.white).font(.subheadline.weight(.heavy))
        Text(countries[correctAnswer]).foregroundColor(.white).font(.largeTitle.weight(.heavy))
 
        }
        ForEach(0..<3) {    number in
            Button {
            flagTapped(number)
            } label: {
                Image(countries[number]).renderingMode(.original).clipShape(Capsule()).shadow(radius: 5)
            }
        }
            Text("SCORE- \(score)").foregroundColor(.white).font(.largeTitle)
            
    }
    }
        .alert(scoreTitle, isPresented: $showing) {
            Button("Continue", action: askQuestion)
        } message: {
            // chalenge 1
            Text("Your score is ")
        }
}
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
    } else {
        scoreTitle = "Wrong"
    }
    showing = true
    
    
}
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

