//
//  BeerStyle.swift
//  BeerStyleList
//
//  Created by Andrew Gonzalez on 4/14/21.
//

import Foundation

struct BeerStyle: Decodable, Identifiable {
    
    let id = UUID()
    let styleName: String
    
}

