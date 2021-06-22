//
//  SideMenuOptionsViewOriginal.swift
//  BeerStyleList
//
//  Created by Andrew Gonzalez on 3/31/21.
//

import Foundation
import SwiftUI

// This will contain all of the contents of the side menu:
struct SideMenuOptionsViewOriginal: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    print("Profile Button Pushed!")
                    
                    
                }) {
                    Image(systemName: "person")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Profile")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                
                        
            }
            .padding(.top, 100)
            
            HStack {
                Button(action: {
                    print("Friends Button Pushed!")
                    
                    
                }) {
                    Image(systemName: "person.3.fill")
                        .foregroundColor(.gray)
                        .imageScale(.small)
                    Text("Friends")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                
                        
            }
            .padding(.top, 30)
            
            HStack {
                Button(action: {
                    print("List Button Pushed!")
                    
                    
                }) {
                    Image(systemName: "list.bullet.rectangle")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Lists")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                
                        
            }
            .padding(.top, 30)
            
            
            HStack {
                Button(action: {
                    print("Settings Button Pushed!")
                    
                    
                }) {
                    Image(systemName: "gear")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Settings")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                
            }
            .padding(.top, 30)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .edgesIgnoringSafeArea(.all)
        
    }
}
