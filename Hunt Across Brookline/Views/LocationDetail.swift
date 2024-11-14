//
//  LocationDetail.swift
//  Hunt Across Brookline
//
//  Created by Theo Chen on 11/12/24.
//

import SwiftUI

struct LocationDetail: View {
    @Environment(ModelData.self) var modelData
    var location: Location

    var locationIndex: Int {
        modelData.locations.firstIndex(where: { $0.id == location.id })!
    }

    var body: some View {
        @Bindable var modelData = modelData

        ScrollView {
            MapView(coordinate: location.locationCoordinate)
                .frame(height: 300)

            CircleImage(image: location.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text("About \(location.name)")
                    .font(.title2)
                Text(location.description)
            }
            .padding()
        }
        .navigationTitle(location.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    return LocationDetail(location: modelData.locations[1])
        .environment(modelData)
}
