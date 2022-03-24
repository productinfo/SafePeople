//
//  OnboardingView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/19/22.
//

import SwiftUI

struct OnboardingView: View {
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(.accentColor)
       UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
       }
    
    var body: some View {
        TabView {
            OnboardingPageView(image: "man", title: "Don't Struggle in Silence",
                               text: K.Onboarding.pageOneText)
            
            OnboardingPageView(image: "iphone",
                               title: "Reach Out for Help",
                               text: K.Onboarding.pageTwoText)
            
            OnboardingPageView(image: "phoneFront", title: "Getting Started",
                               text: K.Onboarding.pageThreeText)
   
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
