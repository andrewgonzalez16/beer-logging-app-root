//
//  AddBeerStyleCore.swift
//  BeerStyleList
//
//  Created by Andrew Gonzalez on 3/31/21.
//

import Foundation
import SwiftUI

struct AddBeerStyleCore: View {
    @State var selection = 0
    var beerStyles = ["IPA", "Stout", "Lager", "Sour", "Cider",]
    var body: some View {
        VStack {
            Text("Add beer style sheet!")
            Picker(selection: $selection, label: Text("Select Beer Style"), content: {
                ForEach(0 ..< beerStyles.count) { index in
                               Text(self.beerStyles[index]).tag(index)
                           }
            })
            
            
        }
    }
}
