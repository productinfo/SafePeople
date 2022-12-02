//
//  MessageExampleCardView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/22/22.
//

import SwiftUI

struct MessageExampleCardView: View {
    let title: String
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text(title)
                    .foregroundColor(.accentColor)
                Spacer()
                Image(systemName: "lightbulb.circle")
                    .foregroundColor(.accentColor)
            }
            .font(.headline)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(text)
                        .multilineTextAlignment(.leading)
                        .font(.footnote)
                }
                .padding(.vertical)
            }
            .textSelection(.enabled)
        }
        .padding()
        .background(.thinMaterial)
        .cornerRadius(6)
    }
}

struct MessageExampleCardView_Previews: PreviewProvider {
    static var previews: some View {
        MessageExampleCardView(title: "Message", text: "This is a messsage. This is a message.")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
