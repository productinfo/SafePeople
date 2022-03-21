//
//  OnboardingView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/19/22.
//

import SwiftUI

struct OnboardingView: View {
    
    var body: some View {
        TabView {
            OnboardingPageView(image: "sisters", title: "Don't Struggle in Silence", text: "We all have different things we struggle with. For some it may be an addiction, others may struggle with depression or anxiety, and some just need some help reaching their goals. Don't struggle alone! Safe People is here to help make reaching out for help easier!", scrollOne: "smallcircle.filled.circle.fill", scrollTwo: "smallcircle.filled.circle", scrollThree: "smallcircle.filled.circle")
            
            OnboardingPageView(image: "man",
                               title: "Reach Out for Help",
                               text: "Reaching out for help is as easy as a press of a button. When you feel tempted, triggered, or in need of help, open the app and press the Safe Button. This will create a message that will be all ready to send to your trusted people!",
                               scrollOne: "smallcircle.filled.circle",
                               scrollTwo: "smallcircle.filled.circle.fill",
                               scrollThree: "smallcircle.filled.circle")
            
            OnboardingPageView(image: "iphone", title: "Getting Started", text: "Open the app, add a Safe Person (or a few), add a custom message, and let your Safe People know they're on your list of trusted people.", scrollOne: "smallcircle.filled.circle", scrollTwo: "smallcircle.filled.circle", scrollThree: "smallcircle.filled.circle.fill")
            
            
                
        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color.offWhite)
        .edgesIgnoringSafeArea(.all)
    }
        
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
