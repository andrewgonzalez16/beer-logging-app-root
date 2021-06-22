//
//  PrivateBeer.swift
//  BeerStyleList
//
//  Created by Andrew Gonzalez on 2/24/21.
//
import SwiftUI
import Foundation

class PrivateBeer_Orignal: ObservableObject {
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
