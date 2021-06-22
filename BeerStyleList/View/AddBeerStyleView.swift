//
//  AddBeerStyleView.swift
//  BeerStyleList
//
//  Created by Andrew Gonzalez on 3/31/21.
//

import Foundation
import SwiftUI

struct AddBeerStyleView: View {
    @Binding var addBeerStyleModal: Bool
    var body: some View {
        NavigationView {
            AddBeerStyleCore()
            
            .navigationBarTitle(Text("Add Beer Style"), displayMode: .inline)
                
            .navigationBarItems(leading: Button(action: {
                    print ("Pushed cancel!")
                self.addBeerStyleModal = false
                
                    
                    
                }) {
                    Text("Cancel")
                })
                
        }
       
    }
}
