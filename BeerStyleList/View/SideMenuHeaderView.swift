//
//  SideMenuHeaderView.swift
//  BeerStyleList
//
//  Created by Andrew Gonzalez on 4/7/21.
//

import SwiftUI

struct SideMenuHeaderView: View {
    @Binding var showSideMenu: Bool
    
    var body: some View {
        // Here is where we'll add all of the static profile info:
        //testUser.firstName = "Andy"
        //testUser.lastName = "Gonzalez"
        
        // This ZStack will be used to hold the close (X) button
        ZStack(alignment: .topTrailing)  {
            Button (action: { withAnimation(.spring()){
                print ("DEBUG: Exit Button Pushed!")
                showSideMenu.toggle()
            } }, label: {
                Image(systemName: "xmark")
                    .frame(width: 32, height: 32)
                    .padding()
            })
            
            
            // VStack will be used to hold all of the general header info:
            VStack (alignment: .leading) {
                Button (action: { print ("DEBUG: Profile Button Pushed!")}, label: {
                    Image(systemName: testUser.profileImage)
                        .resizable()
                        .scaledToFit()
                        .clipped()
                        .frame(width: 64, height: 64)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .padding(.bottom, 16)
                })
                
                // Next we'll add the userName:
                Text("\(testUser.firstName) \(testUser.lastName)")
                    .font(.system(size: 24, weight: .semibold))
                Text("\(testUser.userName)")
                    .font(.system(size: 14, weight: .light ))
                    .padding(.bottom, 24)
                
                // Adding an Hstack Here for Beer Count info:
                HStack (spacing: 12 ) {
                    HStack (spacing: 4) {
                        Button (action: { print ("DEBUG: Unique Beers Button Pushed!IMPLEMENT THE LIST VIEW OF Unique BEERS")}, label: {
                            Text("\(testUser.totalUniqueBeerCount)").bold()
                            Text( "Unique Beers")
                                .font(.system(size: 14, weight: .light ))
                            
                        })
                    }
                    
                    HStack (spacing: 4) {
                        Button (action: { print ("DEBUG: Total Beers Button Pushed! IMPLEMENT THE LIST VIEW OF TOTAL BEERS")}, label: {
                            Text("\(testUser.totalBeerCount)").bold()
                            Text( "Total Beers")
                                .font(.system(size: 14, weight: .light ))
                            
                        })
                        
                    }
                    Spacer()
                }
                Spacer()
                
            }
        }
        // This is setting the font color:
        // Note this won't show up in the preview because the font color is white and so is the background
        //.foregroundColor(.black) // Uncomment to see the view
        //.foregroundColor(.white)
        .foregroundColor(Color (#colorLiteral(red: 0.002655978082, green: 0.5864800811, blue: 1, alpha: 1)))
        .padding()
    }
}

struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView(showSideMenu: .constant(true))
    }
}
