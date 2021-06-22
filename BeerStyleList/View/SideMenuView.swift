//
//  SideMenuView.swift
//  BeerStyleList
//
//  Created by Andrew Gonzalez on 4/7/21.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var showSideMenu: Bool
    
    var body: some View {
        // Wrapping everything in a ZStack to allow for a background color:
        ZStack {
            // Background color of the side menu:
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.yellow, Color.orange]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            //Adding VStack to hold all of the items vertically:
            VStack {
                // Header View goes here:
                
                SideMenuHeaderView(showSideMenu: $showSideMenu)
                    .foregroundColor(Color (#colorLiteral(red: 0.002655978082, green: 0.5864800811, blue: 1, alpha: 1)))
                    .frame(height: 240) // This keeps the view from filling up the whole screen
                
                // Side Menu Options go here:
                ForEach (SideMenuViewModel.allCases, id: \.self) {
                    option in
                    NavigationLink(
                    
                        destination: Text(option.title),
                        label: {
                            SideMenuOptionsView(viewModel: option)
                        }
                    )
                    
                }
                
                Spacer()
                
            }
            
        }
        // VERY IMPORTANT: hiding the navigationBarItems when this view is active is key to getting rid of the button, titles, etc contained in the navigation bar:
        .navigationBarHidden(true)
        
        
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(showSideMenu: .constant(true))
    }
}
