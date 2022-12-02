//
//  MainView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/7/22.
//

import SwiftUI
import MessageUI

struct MainView: View {
    @EnvironmentObject private var userSettings: UserSettings
    @FetchRequest(entity: ContactsEntity.entity(), sortDescriptors: [])
    var persons: FetchedResults<ContactsEntity>
    let message = Message()
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    @Binding var showSidebar: Bool
    @Binding var safeButtonIsPressed: Bool
    @State var alertIsShowing: Bool = false

    var body: some View {
        VStack {
            NavigationTitleView(showSideBar: $showSidebar)
            Spacer()
            
            // SAFE BUTTON
            Button {
                // action
                haptic.impactOccurred()
                safeButtonIsPressed.toggle()
                
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
                VStack {
                    Text("SAFE")
                        .foregroundColor(safeButtonIsPressed ? Color.white : Color.accentColor)
                        .font(.system(size: 32, weight: .bold))
                    Text("button")
                        .foregroundColor(.secondary)
                        .font(.headline)
                }
            }
            .buttonStyle(SimpleButtonStyle())
            Spacer()
        }
        .alert(isPresented: $alertIsShowing) {
            Alert(title: Text("No Safe Person Added Yet"), message: Text("Please add a Safe Person before sending a message"), dismissButton: .default(Text("OK")))
        }
    }
}
