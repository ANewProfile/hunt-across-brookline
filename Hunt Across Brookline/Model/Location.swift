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
    var location: String
    var hint: String
    var question: String

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    var imageBlur: Image {
        Image("\(imageName)-blur")
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
