//
//  OnboardingPageView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/19/22.
//

import SwiftUI

struct OnboardingPageView: View {
    let image: String
    let title: String
    let text: String
    let scrollOne: String
    let scrollTwo: String
    let scrollThree: String

    
    var body: some View {
        ZStack {
            Color.offWhite
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                HStack {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.accentColor)
                    Spacer()
                }
                .padding(.vertical)
                .padding(.horizontal, 30)
                
                HStack {
                    Text(text)
                        .font(.body)
                        .lineSpacing(5)
                        .foregroundColor(Color.accentColor)
                    Spacer()
                }
                .padding(.horizontal, 30)
                
                HStack {
                    Image(systemName: scrollOne)
                    
                    Image(systemName: scrollTwo)
                    Image(systemName: scrollThree)
                }
                .foregroundColor(.accentColor)
                .padding()
                Spacer()
                
                StartButtonView()
                    .padding(.bottom, 30)
                    
               
                
            }
            
        
        }
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(image: "iphone", title: "Safe People", text: "Do you find yourself struggling in a certain area of your life and need any easy way to reach out for help?", scrollOne: "smallcircle.filled.circle.fill", scrollTwo: "smallcircle.filled.circle", scrollThree: "smallcircle.filled.circle")
    }
}
