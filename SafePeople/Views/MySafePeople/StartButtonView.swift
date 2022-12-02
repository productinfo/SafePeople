//
//  StartButtonView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/19/22.
//

import SwiftUI

struct StartButtonView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    var body: some View {
        Button {
            isOnboarding = false
        } label: {
            Text("Get Started")
                .font(.headline)
                .padding()
                .foregroundColor(.accentColor)
                .background(Color.offWhite)
                .cornerRadius(6)
                .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
                .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
        }
    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
    }
}
