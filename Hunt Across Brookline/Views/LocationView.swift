//
//  LocationView.swift
//  Hunt Across Brookline
//
//  Created by Theo Chen on 11/14/24.
//

import SwiftUI

struct LocationView: View {
    var locs: Array<Location>
    var index: Int = 0
    var data: Location = locs[index]
    
    @State private var submitted: Bool = false
    @State private var guess = ""
    @State private var correct = false
    @State private var showHint = false
    
    var body: some View {
        ZStack() {
            VStack() {
                blurredImage
                hintButton
                question
                answer
                submitButton
            }
            if submitted {
                message
            }
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
                ZStack() {
                    Rectangle()
                        .fill(.green)
                        .frame(width: .infinity, height: .infinity)
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Text("Correct!")
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                            .font(Font.custom("BlackFuture", fixedSize: 60))
                        Button(action: onNext) {
                            Text("Next question")
                                .foregroundStyle(.white)
                                .background(.blue)
                            
                        }
                    }
                    
                }
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
    
    func onNext() {
        if
    }
}

#Preview {
    let modelData = ModelData()
    LocationView(locs: modelData.locations)
}
