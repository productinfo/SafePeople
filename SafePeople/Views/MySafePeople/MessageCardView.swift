//
//  MessageCardView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/15/22.
//

import SwiftUI

struct MessageCardView: View {
    @ObservedObject var message: MessageEntity
    var body: some View {
        Text(message.message ?? "Default message goes here.")
            .font(.subheadline)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.leading)
            .lineSpacing(5)
    }
}
