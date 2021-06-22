//
//  PrivateBeer.swift
//  BeerStyleList
//
//  Created by Andrew Gonzalez on 4/14/21.
//

import Foundation
import SwiftUI


struct PrivateBeer: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let brewery: String
    let releaseYear: Int
    let description: String
    let date: Date
    let location: String // This will need to be changed from String to an actual location object using CCLocationManager()
    let rating: Float
    let memorable: Bool
    
    init(beerName: String) {
        name = beerName
        imageName = beerName
        brewery = ""
        releaseYear = Calendar.current.component(.year, from: Date())
        description = ""
        date = Date ()
        location = ""
        rating = 0
        memorable = false
        
    }
}
