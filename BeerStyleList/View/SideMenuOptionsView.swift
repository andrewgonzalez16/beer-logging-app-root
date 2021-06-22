//
//  SideMenuOptionsView.swift
//  BeerStyleList
//
//  Created by Andrew Gonzalez on 4/7/21.
//

import SwiftUI

struct SideMenuOptionsView: View {
    let viewModel: SideMenuViewModel
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: viewModel.imageName)
                .frame(width: 24, height: 24)
            Text(viewModel.title)
                .font(.system(size: 15, weight: .semibold))
            Spacer()
        }
        .foregroundColor(Color (#colorLiteral(red: 0.002655978082, green: 0.5864800811, blue: 1, alpha: 1)))
        .padding()
    }
}

struct SideMenuOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionsView(viewModel: .lists)
    }
}
