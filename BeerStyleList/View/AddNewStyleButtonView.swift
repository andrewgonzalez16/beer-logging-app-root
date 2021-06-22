//
//  AddNewStyleButtonView.swift
//  BeerStyleList
//
//  Created by Andrew Gonzalez on 4/14/21.
//

import SwiftUI

struct AddNewStyleButtonView: View {
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    print("No results Found")
                    
                }) {
                    HStack(spacing: 10) {
                           Image(systemName: "plus.circle")
                        Text("Add New Style...")
                    }
                    .foregroundColor(Color(.systemBlue))
                    
                }
                .padding(.leading)
                Spacer ()
                    
                

            }
        }
        
    }
}

struct AddNewButton_Previews: PreviewProvider {
    static var previews: some View {
        AddNewStyleButtonView()
    }
}
