//
//  MessageCardView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/15/22.
//

import SwiftUI

struct MessageCardView: View {
    @ObservedObject var userSettings = UserSettings()
    
    let text: String
    var body: some View {
        Text(userSettings.customMessage)
            .font(.subheadline)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.leading)
            .lineSpacing(5)
    }
}
