//
//  ContentView.swift
//  BeerStyleList
//
//  Created by Andrew Gonzalez on 2/24/21.
//

import SwiftUI

var testUser = User()

// This settings will be used for App Storage:
struct Settings: Codable {
    static let beerStyleListKey = "beerStyleList"
    static let signedInListKey = "isLoggedIn"
    static let uniqueBeersKey = "uniqueBeerCount"
    static let totalBeersKey = "totalBeerCount"
    static let firstNameKey = "firstName"
    static let lastNameKey = "lastName"
    static let userNameKey = "userName"
    static let darkModeEnabledKey = "darkModeEnabled"
    
}


struct ContentView: View {
    // These booleans will be used to trigger modals for adding beers/styles:
    @State var addBeerModal: Bool = false
    @State var addBeerStyleModal: Bool = false
    @State var showCancelButton: Bool = false
    @State var showSideMenu: Bool = false
    
    var body: some View {
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showSideMenu = false
                    }
                }
            }
        NavigationView {
            GeometryReader {
                geometry in
                
                // We use a ZStack because we want to hide the side menu view behind the main view:
                ZStack {
                    // These next lines will be used to toggle the side menu view:
                    if (showSideMenu) {
                        SideMenuView(showSideMenu: $showSideMenu)
                        
                    }
                    
                    
                    BeerStyleView()
                        .cornerRadius(showSideMenu ? 20: 10)
                        .offset(x: showSideMenu ? geometry.size.width/1.5 : 0, y: showSideMenu ? geometry.size.height * 0.02 : 0 )
                        .scaleEffect(showSideMenu ? 0.8 : 1)
                        .disabled(self.showSideMenu ? true : false)
                        
                    
                   
                }
                
                
                
                
            }
            
            .navigationBarTitle("Beer Styles")
            .navigationBarItems(leading: LeadingBeerNavigatonBarView(showSideMenu: self.$showSideMenu), trailing: TrailingBeerNavigationBarView(addBeerStyleModal: self.$addBeerStyleModal))
    
        }
        .gesture(drag)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone XR")
                //.preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }
}



struct BeerListView: View {
    var body: some View {
        List (0..<2){
            index in NavigationLink(
                destination: SingularBeerView(),
                label: {
                    Text("Beer \(index+1)")
                })
        }
    }
}

struct SingularBeerView: View {
    var beer = PrivateBeer(beerName: "Founders Breakfast Stout");
    var body: some View {
        VStack {
            Text("BEER INFO GOES HERE")
            Text(beer.name)
            
        }
        
    }
}

/* used for search bar: */
extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
