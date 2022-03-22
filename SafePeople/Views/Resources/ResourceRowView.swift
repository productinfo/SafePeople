//
//  ResourceRowView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/21/22.
//

import SwiftUI

struct ResourceRowView: View {
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
                Spacer()
                
                if content != nil {
                    Text("1-800-273-8255")
                } else if (linkLabel != nil && linkDestination != nil) {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                    
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.accentColor)
                } else {
                    EmptyView()
                }
                
            }
            .padding()
        }
    }
}

struct ResourceRowView_Previews: PreviewProvider {
    static var previews: some View {
        ResourceRowView(name: "Website")
    }
}
