//
//  SideMenuViewModel.swift
//  BeerStyleList
//
//  Created by Andrew Gonzalez on 4/13/21.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case lists
    case friends
    case settings
    case logout
    
    var title: String {
        
        switch self {
        case .profile: return "Profile"
        case .lists: return "Lists"
        case .friends: return "Friends"
        case .settings: return "Settings"
        case .logout: return "Logout"
        
        }
    }
    
    var imageName: String {
        
        switch self {
        case .profile: return "person"
        case .lists: return "list.bullet.rectangle"
        case .friends: return "person.3.fill"
        case .settings: return "gear"
        case .logout: return "arrow.left.square"
        
        }
    }
}
