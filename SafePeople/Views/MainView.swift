//
//  MainView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/7/22.
//

import SwiftUI
import MessageUI

struct MainView: View {
    @Binding var showSidebar: Bool
    @Binding var safeButtonIsPressed: Bool
    @EnvironmentObject private var userSettings: UserSettings
    let message = Message()
    @State var alertIsShowing: Bool = false
    
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    
    @FetchRequest(entity: ContactsEntity.entity(), sortDescriptors: [])
    var persons: FetchedResults<ContactsEntity>
    

    
    var body: some View {
        VStack {
            NavigationTitleView(showSideBar: $showSidebar)
            
            Spacer()
            
            // SAFE BUTTON
            Button {
                // action
                safeButtonIsPressed.toggle()
                haptic.impactOccurred()
                
                if persons.isEmpty {
                    alertIsShowing.toggle()
                } else {
                    // Create numbers array
                    var numbers: [String] = []
                    for person in persons {
                        numbers.append(person.number!)
                    }
                    
                    // Send Message
                    message.sendMessage(message: userSettings.customMessage, phone: numbers)
                    
                }
                
                // refresh home screen
                safeButtonIsPressed.toggle()
                
            } label: {
                
                Text("Safe Button")
                    .foregroundColor(safeButtonIsPressed ? Color.white : Color.accentColor)
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                
            }
            .buttonStyle(SimpleButtonStyle())
            
            Spacer()
            
        }
        .alert(isPresented: $alertIsShowing) {
            Alert(title: Text("No Safe Person Added Yet"), message: Text("Please add a Safe Person before sending a message"), dismissButton: .default(Text("OK")))
        }
        
        
    }
}


