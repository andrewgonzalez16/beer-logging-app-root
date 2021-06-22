//
//  SearchBarView.swift
//  BeerStyleList
//
//  Created by Andrew Gonzalez on 4/8/21.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @State var showCancelButton: Bool = false
    
    var body: some View {
        // This HStack will hold the search view:
        VStack {
            HStack {
                // This HStack will hold the actual search bar itself
                HStack {
                    // Setting the magnifying glass icon in the search field
                    Image(systemName: "magnifyingglass")
                    // Creating the actual search field box:
                    // TextField() is defined in the following way:
                    // @text: is going to be the String variable that is dynamically changing based on what the user is typing into the search bar aka the State property
                    // @onEditingChanged: is the property that informs the app when the user begins or ends editing the text; in this case we want to show the cancel button when the user is editing the text so we set showCancelButton to true
                    // @onCommit: is the property that executes when the user commits/submits their edits
                    TextField("Search Styles",
                              text:$searchText, onEditingChanged: {
                                isEditing in self.showCancelButton = true
                                
                              }, onCommit: {
                                print ("onCommit")
                              }
                    )
                    // Next we just add some styling to the text field foreground color:
                    .foregroundColor(.primary)
                    // Now we'll add a cancel button  to the HStack housing the search bar field
                    
                    // @action : is what will happen when the button is pressed. In this case we'll set the dynamic search string to an empty string effectively setting the search parameter to empty
                    // We'll also set an for the cancel button and fill it (aka make it visible) based on whether or not the search text has any value
                    
                    Button(action: {
                        self.searchText = ""
                    })
                    {
                        Image(systemName: "xmark.circle.fill")
                            .opacity(searchText == "" ? 0: 1)
                    }
                    
                }
                // Next we'll add some styling to the HStack housing these components:
                // We add padding to HStack which will make it look like an its own individual search bar component as well as center it
                // Then add some gray color to the HStack background to give it the stock feel:
                // And lastly we soften/round out the corners of the search bar so that it doesn't look like a rectangle with hard edges
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)
                
                
                // We're going to do a conditional adding of the cancel button based on whether or not the showCancelButton=true (This variable is one we set above when the search bar is clicked)
                if showCancelButton {
                    Button("Cancel") {
                        UIApplication.shared.endEditing(true) // This must be placed before the other commands here
                        self.searchText = ""
                        self.showCancelButton = false
                    }
                    .foregroundColor(Color(.systemBlue))
                }
                
            } // END  of search bar component
            .padding(.bottom, 7)
            .background(Color.white)
            // Now we're going to finish up the search view HStack which houses both the search bar and the 'Cancel' button which will exit the search view:
            // Adding a conditional that shows/hides the navigation bar items (title, buttons, etc.) based on whether the value of showCancelButton AKA whether or not the search bar was clicked:
            .navigationBarHidden(showCancelButton)
            
            //AddNewStyleButtonView()
            
        }
        
        
        
        
    }
    
    
    
}


struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        BeerStyleView()
    }
}
