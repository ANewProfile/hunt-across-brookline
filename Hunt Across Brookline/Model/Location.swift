//
//  Location.swift
//  Hunt Across Brookline
//
//  Created by Theo Chen on 11/12/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Location: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
<<<<<<< HEAD
    var question: String
    var hint: String
=======
>>>>>>> 17bd0d671667809749bce65844bf48a23ff7b2c8

    private var imageName: String
    var image: Image {
        Image(imageName)
    }

    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
