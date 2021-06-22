//
//  User.swift
//  BeerStyleList
//
//  Created by Andrew Gonzalez on 3/31/21.
//

import Foundation

class User: Identifiable {
    var id = UUID()
    // This is temp obviously:
    let userName: String
    let userPassword: String
    let email: String
    
    var firstName: String = ""
    var lastName: String = ""
    var profileImage = "person.crop.circle.badge.plus"
    var totalBeerCount: Int = 0
    var totalUniqueBeerCount: Int = 0
    
    
    var loggedBeers: [PrivateBeer] = []
    var savedBeerStyles: [BeerStyle] = []
    //var beerImages: [UIImageView:UIImage]
    var friendsList: [User] = []
    
    init(userName: String, password: String, email: String) {
        self.userName = userName
        self.userPassword = password
        self.email = email
    }
    
    // THis will be usesd to create a static sample user:
    init() {
        self.userName = "@agonzalez"
        self.userPassword = "password"
        self.email = "agonzalez@example.com"
        self.firstName = "Andrew"
        self.lastName = "Gonzalez"
    }
    
}
