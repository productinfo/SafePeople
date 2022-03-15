//
//  NeuomorphicStyleTextfield.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/14/22.
//
import SwiftUI

struct NeumorphicStyleTextField: View {
    var textField: TextField<Text>
    var imageName: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
            
            textField
                .foregroundColor(.darkShadow)
        }
        .padding()
        .foregroundColor(.neumorphictextColor)
        .background(Color.offWhite)
        .cornerRadius(6)
        .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
        .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
            
        }
}
