//
//  LocationView.swift
//  Hunt Across Brookline
//
//  Created by Theo Chen on 11/14/24.
//

import SwiftUI

struct LocationView: View {
    @State private var showHint: Bool = false
    var data: Location
    
    var body: some View {
        VStack {
            data.imageBlur
                .resizable()
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
            
            Spacer()
            
            Text(data.question)
                .font(.headline)
                .padding()
            
            Button(action: {
                showHint.toggle()
            }) {
                Text("Hint")
                    .font(.headline)
                    .padding()
            }
            
            if showHint {
                Text(data.hint)
                    .font(.subheadline)
            }
            
            Spacer()
        }
    }
}

#Preview {
    let modelData = ModelData()
    LocationView(data: modelData.locations[0])
}
