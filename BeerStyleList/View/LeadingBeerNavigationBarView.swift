//
//  LeadingBeerNavigationBarView.swift
//  BeerStyleList
//
//  Created by Andrew Gonzalez on 3/31/21.
//

import Foundation
import SwiftUI

struct LeadingBeerNavigatonBarView: View {
    @Binding var showSideMenu: Bool
    
    var body: some View {
        HStack {
            Button( action: {
                print("DEBUG: Show menu here!!")
                withAnimation(.spring()){
                    showSideMenu.toggle()
                }
            })
            {
                Image(systemName: "line.horizontal.3")
                    .imageScale(.large)
            }
            
        }
        
        
    }
}
