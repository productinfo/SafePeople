//
//  MenuItemView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/7/22.
//

import SwiftUI

struct MenuItemView: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
                .font(.headline)
            
            Text(text)
                .foregroundColor(.white)
                .font(.headline)
            
            Spacer()
        }
        .padding()
    }
}

