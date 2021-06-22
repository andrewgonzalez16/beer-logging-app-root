//
//  PrivateBeerViewModel.swift
//  BeerStyleList
//
//  Created by Andrew Gonzalez on 4/14/21.
//

import Foundation
import SwiftUI

class PrivateBeerViewModel: ObservableObject {
    @Published var recordedBeer = PrivateBeer(beerName: "Founders Breakfast Stout");
    
}
