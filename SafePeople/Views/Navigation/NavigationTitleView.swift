//
//  NavigationTitleView.swift
//  Triggered
//
//  Created by Brittany Rima on 3/6/22.
//

import SwiftUI

struct NavigationTitleView: View {
    @Binding var showSideBar: Bool
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        HStack {
            AppTitleView()
            Spacer()
            Button {
                showSideBar.toggle()
                haptic.impactOccurred()
            } label: {
                HamburgerMenuButton()
            }
        }
        .padding()
    }
}
