//
//  ContactListItemView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/12/22.
//

import SwiftUI

struct ContactListItemView: View {
    @ObservedObject var person: ContactsEntity
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(person.name ?? "Name not available")
                    .font(.headline)
            }
            .foregroundColor(.accentColor)
        
            Spacer()
        }
    }
}
