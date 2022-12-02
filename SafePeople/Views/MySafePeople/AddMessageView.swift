//
//  AddMessageView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/15/22.
//

import SwiftUI

struct AddMessageView: View {
    @EnvironmentObject private var userSettings: UserSettings
    @Environment (\.presentationMode) var presentationMode
    @State var newMessage = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                Group {
                    HStack {
                        Text("Add Custom Message")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.horizontal)
                }

                Group {
                    VStack(spacing: 10) {
                        InfoCardView()
                            .padding()

                        Spacer()
                        
                        Text("New Message")
                            .font(.headline)
                            .foregroundColor(Color.accentColor)

                        Text(newMessage)
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                            .padding(.horizontal)

                        NeumorphicStyleTextField(textField: TextField("New Custom Message", text: $newMessage), imageName: "plus.message")
                            .padding()

                        Button {
                            // Save
                            userSettings.customMessage = newMessage
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Save")
                                .font(.headline)
                                .padding()
                                .background(Color.accentColor)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                    }
                    .padding()
                    Spacer()
                }
            }
            .background(Color.offWhite)
        }
    }
}

struct AddMessageView_Previews: PreviewProvider {
    static var previews: some View {
        AddMessageView()
    }
}
