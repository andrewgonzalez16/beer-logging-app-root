//
//  TestStruct.swift
//  BeerStyleList
//
//  Created by Andrew Gonzalez on 3/31/21.
//

import Foundation
import SwiftUI

struct BeerStyleNavigationBarView1: View {
    @Binding var addBeerStyleModal: Bool
    var body: some View {
        HStack {
            Button(action: {
                self.addBeerStyleModal.toggle()
                
                
            }) {
                Text("Add Beer Style ahahah")
            }
        }
        .sheet(isPresented: $addBeerStyleModal, content: {
            AddBeerStyleView(addBeerStyleModal: self.$addBeerStyleModal)
            
        })
        
    }
}
