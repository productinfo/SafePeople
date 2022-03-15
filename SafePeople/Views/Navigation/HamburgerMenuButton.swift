//
//  HamburgerMenuButton.swift
//  Triggered
//
//  Created by Brittany Rima on 3/6/22.
//

import SwiftUI

struct HamburgerMenuButton: View {
    
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                Color.accentColor
                        .frame(width: 35, height: 3)
                    .cornerRadius(12)
            }
                
                
                
                
                    Color.accentColor
                            .frame(width: 35, height: 3)
                        .cornerRadius(12)
        
                
                
            
        }
        .frame(width: 75, height: 50)
       
    }
}

struct HamburgerMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        HamburgerMenuButton()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
