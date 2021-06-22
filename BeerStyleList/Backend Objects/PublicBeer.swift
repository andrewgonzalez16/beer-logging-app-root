//
//  PrivateBeer.swift
//  BeerStyleList
//
//  Created by Andrew Gonzalez on 3/31/21.
//

import Foundation

class PublicBeer: ObservableObject {
    var id = UUID ()
    var imageName: String
    var name: String
    var brewery: String
    var releaseYear: Int
    var description: String
    var date: Date
    var location: String // This will need to be changed from String to an actual location object using CCLocationManager()
    var rating: Float
    var memorable: Bool
    
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
