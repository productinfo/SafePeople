//
//  ContactRowView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/26/22.
//


import SwiftUI
import Contacts

struct ContactRow: View {
    var contact: CNContact
    @Binding var showPicker: Bool
    @Binding var selectedContact: CNContact?
    
    var body: some View {
        Button(action: {
            selectContact()
        }) {
            HStack {
                Text("\(contact.familyName)").fontWeight(.bold)
                Text("\(contact.givenName) \(contact.middleName)")
            }
            .foregroundColor(.black)
        }
    }
    
    func selectContact() {
        self.selectedContact = self.contact
        self.showPicker = false
    }
}

