//
//  SidebarContent.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/7/22.
//

import SwiftUI

struct SidebarContent: View {
    @Binding var menuButtonPressed: Bool
    @Binding var isShowingDetailView: Bool
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text("Menu")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.horizontal)
            
            Divider()
                .padding()

            Group {
                // SAFE PEOPLE
                NavigationLink(isActive: $menuButtonPressed) {
                    SafePeopleView()
                } label: {
                    MenuItemView(icon: "person.2", text: "Safe People")
                }

                // RESOURCES
                NavigationLink {
                    // Resources Page Link
                    ResourceView()
                } label: {
                    MenuItemView(icon: "books.vertical", text: "Resources")
                }

                // SETTINGS
                NavigationLink {
                    // Settings Link
                    SettingsView()
                } label: {
                    MenuItemView(icon: "gearshape.2", text: "Settings")
                }
            }
            Spacer()
            
            // CLOSE BUTTON
            Button {
                showMenu = false
            } label: {
                HStack {
                    Image(systemName: "xmark.circle")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text("Close")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding()
                .padding(.bottom, 20)
            }
        }
        .padding(.top, 50)
        .background(Color.accentColor)
        .edgesIgnoringSafeArea(.bottom)
    }
}
