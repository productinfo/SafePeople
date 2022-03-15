//
//  MainView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/7/22.
//

import SwiftUI

struct MainView: View {
    @Binding var showSidebar: Bool
    @Binding var safeButtonIsPressed: Bool
    
    var body: some View {
            VStack {
                    NavigationTitleView(showSideBar: $showSidebar)
                        
                    Spacer()
                    
                    // SAFE BUTTON
                    Button {
                        // action
                        safeButtonIsPressed.toggle()
                        
                        // alert message confirming text
                        // refresh home screen
                        // take user to text message
                        
                    } label: {
                        
                        Text("Safe Button")
                            .foregroundColor(safeButtonIsPressed ? Color.white : Color.accentColor)
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                        
                    }
                    .buttonStyle(SimpleButtonStyle())
                    
                  Spacer()
                    
            }
            
        
    }
}


