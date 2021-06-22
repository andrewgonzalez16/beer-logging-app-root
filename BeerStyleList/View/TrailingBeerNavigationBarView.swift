//
//  TrailingBeerNavigationBarView.swift
//  BeerStyleList
//
//  Created by Andrew Gonzalez on 3/31/21.
//

import Foundation
import SwiftUI

struct TrailingBeerNavigationBarView: View {
    @Binding var addBeerStyleModal: Bool
    var body: some View {
        HStack {
            Button(action: {
                self.addBeerStyleModal.toggle()
                
                
            }) {
                Image(systemName: "plus")
                Text("🍺")
            }
        }
        .sheet(isPresented: $addBeerStyleModal, content: {
            AddBeerStyleView(addBeerStyleModal: self.$addBeerStyleModal)
            
        })
        
    }
}
