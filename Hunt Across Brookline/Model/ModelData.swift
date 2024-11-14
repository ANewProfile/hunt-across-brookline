//
//  ModelData.swift
//  Hunt Across Brookline
//
//  Created by Theo Chen on 11/12/24.
//

import Foundation


@Observable
class ModelData {
<<<<<<< HEAD
    var locations: [Location] = load("locationDataHard.json")
=======
    var locations: [Location] = load("locationData.json")
>>>>>>> 17bd0d671667809749bce65844bf48a23ff7b2c8
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
