//
//  LocationView.swift
//  Hunt Across Brookline
//
//  Created by Theo Chen on 11/14/24.
//

import SwiftUI

struct LocationView: View {
    @State private var showHint: Bool = false
    @State private var submit: Bool = false
    @State private var guess = ""
    var data: Location
    
    var body: some View {
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
            
            Spacer()
            
            Text(data.question)
                .padding()
            
            TextField("Answer", text: $guess)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.green, lineWidth: 2)
                )
                .padding()
            
            Button(action: {
                submit.toggle()
            }) {
                Text("Submit")
                    .foregroundStyle(.blue)
                    .font(.headline)
            }
            
            if submit {
                ForEach(0 ..< data.answer.count, id: \.self) { answer in
                    if guess == data.answer[answer] {
                        Text("Correct!")
                            .foregroundStyle(.green)
                            .font(.headline)
                    }
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    let modelData = ModelData()
    LocationView(data: modelData.locations[0])
}
