//
//  SettingsView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/11/22.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                
                // ABOUT THE APP
                GroupBox {
                    Divider()
                        .padding(.vertical, 4)
                    
                    HStack(alignment: .center, spacing: 10) {
                        Image("appLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .cornerRadius(9)
                        
                        Text("Safe People is an app dedicated to helping you step out of isolation by making it easier to reach out to those you consider safe.")
                            .font(.footnote)
                    }
                } label: {
                    SettingsLabelView(labelText: "Safe People", labelImage: "info.circle")
                }
                
                // RESTART LAUNCH SCREEN
                GroupBox {
                    Divider()
                        .padding(.vertical, 4)
                    
                    Text("You can restart this application by toggling the switch in this box. This will start the onboarding process and you will see the welcome screen again.")
                        .padding(.vertical, 8)
                        .frame(minHeight: 60)
                        .layoutPriority(1)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    Toggle(isOn: $isOnboarding) {
                        if isOnboarding {
                            Text("Restarted".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                        } else {
                            Text("Restart".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding()
                    .background(Color(UIColor.tertiarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                } label: {
                    SettingsLabelView(labelText: "Restart", labelImage: "gobackward")
                }

                GroupBox {
                    SettingsRowView(name: "Developer", content: "Brittany Rima")
                    SettingsRowView(name: "Collaborator", content: "Sarah Peters")
                    SettingsRowView(name: "Version", content: "1.1.0")
                } label: {
                    SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                }
            }
            .padding()
        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
