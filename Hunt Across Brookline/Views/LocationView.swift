//
//  LocationView.swift
//  Hunt Across Brookline
//
//  Created by Theo Chen on 11/14/24.
//

import SwiftUI

struct LocationView: View {
    @State private var submitted: Bool = false
    @State private var guess = ""
    @State private var correct = false
    @State private var showHint = false
    var data: Location
    
    var body: some View {
        blurredImage
        hintButton
        question
        answer
        submitButton
        if submitted {
            message
        }
    }
    
    var blurredImage: some View {
        VStack {
            data.imageBlur
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(maxHeight: UIScreen.main.bounds.height / 2.5)
            
            Spacer()
            
            Text(data.location)
                .font(.headline)
                .padding()
                .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    var hintButton: some View {
        VStack {
            Button(action: {
                showHint.toggle()
            }) {
                ZStack() {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2)
                        .fill(Color.blue)
                        .padding()
                    
                    Text("Hint")
                        .foregroundStyle(.white)
                        .padding()
                        .font(.headline)
                }

            }
            
            if showHint {
                Text(data.hint)
                    .font(.subheadline)
            }
        }
    }
    
    var question: some View {
        Text(data.question)
            .padding()
    }
    
    var answer: some View {
        TextField("Answer", text: $guess)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.green, lineWidth: 2)
            )
            .padding()
            .disabled(!guess.isEmpty && submitted)
    }
    
    var submitButton: some View {
        Button(action: onSubmit) {
            Text("Submit")
                .foregroundStyle(.blue)
                .font(.headline)
        }
    }
    
    var message: some View {
        Group {
            if correct {
                Text("Correct!")
                    .foregroundStyle(.green)
            } else {
                Text("Incorrect!")
                    .foregroundStyle(.red)
            }
        }
        .font(.headline)
        .transition(.scale)
    }
    
    func onSubmit() {
        if !guess.isEmpty {
            withAnimation {
                submitted = true
                verifyAnswer()
            }
        }
    }
    
    func verifyAnswer() {
        correct = data.answer.contains(guess)
    }
}

#Preview {
    let modelData = ModelData()
    LocationView(data: modelData.locations[0])
}
