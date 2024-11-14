//
//  MapView.swift
//  Hunt Across Brookline
//
//  Created by Theo Chen on 11/12/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D

    var body: some View {
        Map(position: .constant(.region(region)))
    }

    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
<<<<<<< HEAD
            span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
=======
            span: MKCoordinateSpan(latitudeDelta: 0.0025, longitudeDelta: 0.0025)
>>>>>>> 17bd0d671667809749bce65844bf48a23ff7b2c8
        )
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
