//
//  SettingsRowView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/21/22.
//

import SwiftUI

struct SettingsRowView: View {
    var name: String
    var content: String?
    var linkLabel: String?
    var linkDestination: String?
    
    var body: some View {
        VStack {
            Divider()
                .padding(.vertical, 4)
            
            HStack {
                Text(name)
                    .foregroundColor(.gray)
                Spacer()
                
                if content != nil {
                    Text(content!)
                } else if (linkLabel != nil && linkDestination != nil) {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                    
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.accentColor)
                } else {
                    EmptyView()
                }
            }
        }
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(name: "Instagram", linkLabel: "brit_codes", linkDestination: "instagram/brit_codes")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
