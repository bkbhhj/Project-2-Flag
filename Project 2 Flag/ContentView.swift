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
    @State private var score = 0
    @State private var question = 0
    
    @State private   var countries = [ "Estonia", "France", "Germany",
    "Ireland", "Italy", "Nigeria", "Poland", "Russia","Spain", "UK", "US" ]
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
            Button {    flagTapped(number)
                            } label: {
                Image(countries[number]).renderingMode(.original).clipShape(Capsule()).shadow(radius: 5)
            }
        }
            Text("SCORE- \(score)").foregroundColor(.white).font(.largeTitle)
            
    }
    } // chalenge 3
        .alert(scoreTitle, isPresented: $showing) { if question == 8 {
            Button("Reset", action: reset)
        } else {
            Button("Continue", action: askQuestion) }
        } message: {
            Text("Your score is \(score)")


            // chalenge 1
            Text("Your score is \(score)")
        }
}
    func flagTapped(_ number: Int) {
        
     
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            question += 1
    } else {
        // chalenge 2
        scoreTitle = "Wrong!!!" + " " +
        "That's the flag of \(countries[number])"
        question += 1

    }
    showing = true
    
    
}
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    func reset () {
        question = 0
        score = 0
        askQuestion()
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

