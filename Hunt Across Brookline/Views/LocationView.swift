//
//  LocationView.swift
//  Hunt Across Brookline
//
//  Created by Theo Chen on 11/14/24.
//

import SwiftUI

struct LocationView: View {
    var data: Location
    
    var body: some View {
        VStack {
            data.image
                .resizable()
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
            
            Spacer()
        }
    }
}

#Preview {
    let modelData = ModelData()
    LocationView(data: modelData.locations[0])
}
