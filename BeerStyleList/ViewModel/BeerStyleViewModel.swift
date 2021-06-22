//
//  BeerStyleViewModel.swift
//  BeerStyleList
//
//  Created by Andrew Gonzalez on 4/14/21.
//

import Foundation
import SwiftUI

class BeerStyleViewModel: ObservableObject {
    
    @Published private var MOCK_BeerStyles: [BeerStyle] = [
        .init(styleName: "IPA"),
        .init(styleName: "Stout"),
        .init(styleName: "Sour"),
        .init(styleName: "Pale Ale"),
        .init(styleName: "Farm House Ale"),
        .init(styleName: "Cider"),
        .init(styleName: "Wilde Ale")
        
    ]
    
    let userDefaults = UserDefaults.standard
    // Making this array a 'Published' variable will notify the view that it needs to be rebuilt/updated to reflect any changes whenever this variable is modified:
    @Published var beerStlyeList_StringArray: [String]? = nil
    
    init() {
        //print ("User Default: \(userDefaults.dictionaryRepresentation())")
        // Removing user default test value:
        //UserDefaults.standard.removeObject(forKey: "myKey")
        
        beerStlyeList_StringArray = userDefaults.object(forKey: Settings.beerStyleListKey) as? [String] ?? []
        
        if (beerStlyeList_StringArray == nil || beerStlyeList_StringArray == []) {
            beerStlyeList_StringArray = getStringArray()
            userDefaults.set(beerStlyeList_StringArray, forKey: Settings.beerStyleListKey)
        }
        
        //updateUserDefaultDictionary()print ("beerStlyeList_Array \(beerStlyeList_StringArray)")
        
    }
    
    
    func getStringArray() -> [String] {
        if let stringBeerStyles = beerStlyeList_StringArray {
            return stringBeerStyles
        }
        
        var stringBeerStyles: [String] = []
        for beerStyle in self.MOCK_BeerStyles {
            stringBeerStyles.append(beerStyle.styleName)
        }
        return stringBeerStyles.sorted()
        
    }
    
    func addToBeerStyleList(styleName: String){
        
        //print ("Adding to beer style list!!!")
        // This gaurds against empty values:
        guard !styleName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return
        }
        // This is an extra check which gaurds against duplicate values:
        if (isDuplicate(styleName: styleName)){
            //print ("Cannot Add Item due to being duplicate")
            return
        }
        
        
        MOCK_BeerStyles.append(BeerStyle(styleName: styleName))
        
        beerStlyeList_StringArray?.append(styleName)
        beerStlyeList_StringArray = beerStlyeList_StringArray?.sorted()
        updateUserDefaultDictionary()
        
        
        
    }
    
    func deleteFromBeerStyleList(indexSet: IndexSet){
        //print("Reached teh delete from Beer Style Function!!!")
        // removing it from current list:
        beerStlyeList_StringArray?.remove(atOffsets: indexSet)
        updateUserDefaultDictionary()
        
    }
    
    //Used to write to user defualt dictionary:
    func updateUserDefaultDictionary() {
        userDefaults.set(beerStlyeList_StringArray, forKey: Settings.beerStyleListKey)
    }
    
    func isDuplicate(styleName: String) -> Bool {
        // This gaurds against duplicate values:
        if (self.getStringArray().contains(where: {$0.caseInsensitiveCompare(styleName.trimmingCharacters(in: .whitespacesAndNewlines)) == .orderedSame})) {
            //print ("Cannot Add Item due to being duplicate")
            return true
        }
        
        return false
    }
    
}
