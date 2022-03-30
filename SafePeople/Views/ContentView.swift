//
//  ContentView.swift
//
//
//  Created by Brittany Rima on 3/6/22.
//

import SwiftUI

struct ContentView: View {
    @State var showSidebar: Bool = false
    @State private var safeButtonIsPressed: Bool = false
    @State private var menuButtonPressed: Bool = false
    @State private var isShowingDetailView: Bool = false
    
    
    
    var body: some View {
        

        
        return NavigationView {
            ZStack {
                
                
                Color.offWhite
                    .edgesIgnoringSafeArea(.all)
                
                
                MainView(showSidebar: $showSidebar, safeButtonIsPressed: $safeButtonIsPressed)
                    
                
                GeometryReader { _ in
                    
                    HStack {
                        Spacer()
                           
                        SidebarContent(menuButtonPressed: $menuButtonPressed, isShowingDetailView: $isShowingDetailView, showMenu: $showSidebar)
                            .offset(x: showSidebar ? UIScreen.main.bounds.width / 2 : UIScreen.main.bounds.width)
                            .animation(Animation.easeInOut.speed(2), value: showSidebar)
                    }
                }
                .background(Color.gray.opacity(showSidebar ? 0.5 : 0.0))
                .onTapGesture {
                    showSidebar = false
                }
                
                
            }
            .navigationBarHidden(true)
     
            
            
        } //: NAV
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .environmentObject(UserSettings())
        
    }
}
