//
//  BeerStyleView.swift
//  BeerStyleList
//
//  Created by Andrew Gonzalez on 4/8/21.
//

import SwiftUI

struct BeerStyleView: View {
    @State private var searchText = ""
    @StateObject var beerStylesListViewModel = BeerStyleViewModel()
    @State var newStyle = ""
    
    
    
    init () {
        UITableViewCell.appearance().backgroundColor = UIColor.white
        UITableView.appearance().backgroundColor = UIColor.white
    }
    
    
    var body: some View {
        var beerStyleList_StringArray = beerStylesListViewModel.beerStlyeList_StringArray
        // This Vstack will hold the current/dynamic search results
        ZStack {
            Color.white
            VStack (alignment: .leading) {
                // This View will hold the search view:
                SearchBarView(searchText: $searchText)
                    
                
                // Adding some formatting to the HStack which house the HStack search view:
                    .padding(.horizontal)
                    .padding(.top, 16)
                
                // This code contains the add New Style functionality:
                VStack {
                    HStack {
                        Button(action: {
                            alertView()
                            
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
                //.padding(.horizontal)
                .frame(width: .infinity, height: 25, alignment: .leading)
                .padding(.bottom, -10)
                
    
                // Next we will add the list of search results:
                List () {
        
                    // The following ForEach statement filters the string array of stock names *** This is a temp solution as ideally we could filter while directly accessing the viewModel.stocks.stock.title and not have to create a seperate string array in order to sort/filter results properly:
                    
                    // The following statements are used to display list properly while having the search results return based on a case insensitive contains:
                    if (searchText == "") { // If search text is an empty string
                        // if the search text is an empty string then use the hasPrefix function to properly display results of everything available in the styles array
                        ForEach ((beerStyleList_StringArray)?.filter{ $0.hasPrefix(searchText) || searchText == ""} ?? [], id:\.self) {
                                searchText in NavigationLink(
                                    
                                    destination: BeerListView(),
                                    label: {
                                        Text("🍺 \(searchText)")
                                    }
                                )
                        }
                        .onDelete(perform: deleteBeerStyle)
                        
                    }
                    else { // If something is typed into the search bar
                        // Perform a case insensitve contains search:
                        
                        ForEach ((beerStyleList_StringArray)?.filter{ $0.range(of: searchText, options: .caseInsensitive) != nil} ?? [], id:\.self) {
                            searchText in NavigationLink(
                                
                                destination: BeerListView(),
                                label: {
                                    Text("🍺 \(searchText)")
                                }
                            )
                        }
                        
                        /* A more dynamic method would be:
                        var listItemsTest = viewModel.stocks.filter{ $0.title.range(of: searchText, options: .caseInsensitive) != nil}
                        
                        ForEach (listItemsTest) {
                            listItem1 in Text(listItem1.title)
                        }
                        */
                    }
                        
                    
                }
                .resignKeyboardOnDragGesture()
                
            }
        }
        
        
    }
    
    // custom function to show an add style button when a no (or <=1) result(s) are returned upon a valid search
    // We don't need to pass in any variables because we can access the 'searchText' variable from this function
    func showAddStyleSearchBar () -> Bool {
        var showAddButton: Bool = false
        
        //var results = stringStockArray.filter{$0.hasPrefix(searchText)}
        var results = beerStylesListViewModel.beerStlyeList_StringArray?.filter{$0.range(of: searchText, options: .caseInsensitive) != nil} ?? []
        
        if ((results.count == 0 || results.count == 1) && searchText != ""){
            showAddButton = true
        }
        
        return showAddButton
        
    }
    
    // This function will handle the delete option from swiping left on the row:
    func deleteBeerStyle (at offsets: IndexSet) {
        // Calling the function to remove the value from the list:
        beerStylesListViewModel.deleteFromBeerStyleList(indexSet: offsets)
        
        
        
        
        
    }
    // End of View body
    func alertView() {
        
        // Creating the Alert:
        let alert = UIAlertController(title: "Add Beer Style", message: "Enter New Beer Style", preferredStyle: .alert)
        
        alert.addTextField {
            (_) in
            // Noting to add here
        }
        
        // Action Buttons...
        
        let addStyleButton = UIAlertAction(title: "Add Style", style: .default) {
            (_) in
            
            // implement Add Style logic here
            newStyle = alert.textFields![0].text!
            beerStylesListViewModel.addToBeerStyleList(styleName: newStyle)
            
        }
        
        addStyleButton.isEnabled = false
        
        NotificationCenter.default.addObserver(
            forName: UITextField.textDidChangeNotification,
            object:alert.textFields?[0],
            queue: OperationQueue.main) {
            (notification) -> Void in

                //let textFieldBeerStyle = alert.textFields?[0] as! UITextField
                let textFieldBeerStyle = alert.textFields![0].text!
            
                // First check/gaurding against an empty value being submitted:
                if (textFieldBeerStyle.trimmingCharacters(in: .whitespacesAndNewlines) == ""){
                    addStyleButton.isEnabled = false
                }
                // Gaurding against duplicate values:
                else if (beerStylesListViewModel.isDuplicate(styleName: textFieldBeerStyle)){
                    addStyleButton.isEnabled = false
                }
                else { // Valid Value:
                    addStyleButton.isEnabled = true
                }
                
            }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) {
            (_) in
            // reset the newStyle value:
            newStyle = ""
            // implement cancel button logic here
        }
        
        // Add buttons into alertView
        alert.addAction(cancel)
        alert.addAction(addStyleButton)
        
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert,animated: true, completion: {
            
            // Do implement completion logic here:
        })
        
    }
}

struct BeerStyleView_Previews: PreviewProvider {
    static var previews: some View {
        BeerStyleView()
    }
}
