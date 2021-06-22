//
//  BeerStyle.swift
//  BeerStyleList
//
//  Created by Andrew Gonzalez on 3/11/21.
//

import Foundation

class BeerStyle_Orignal: Identifiable {
    var id = UUID()
    let styleName: String
    // In each style we're going to keep a dictionary of beers
    var beers: [String: PrivateBeer] = [:]
    
    init(style: String) {
        styleName = style
    }
    
    // This function will add PrivateBeers to the the beers dictionary appropriately
    func addBeerToDictionary(newBeer: PrivateBeer) {
        let key = newBeer.name
        self.beers[key] = newBeer
    }
}

