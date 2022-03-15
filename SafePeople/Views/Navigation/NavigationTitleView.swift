//
//  NavigationTitleView.swift
//  Triggered
//
//  Created by Brittany Rima on 3/6/22.
//

import SwiftUI

struct NavigationTitleView: View {
    @Binding var showSideBar: Bool
    
    var body: some View {
        
            HStack {
                AppTitleView()
                Spacer()
                
                Button {
                    // Show menu
                    showSideBar.toggle()
                } label: {
                    HamburgerMenuButton()
                }

                
            }
            .padding()
            
        
    }
}

