//
//  ContactRowView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/26/22.
//


import SwiftUI
import Contacts

struct ContactRow: View {
    var contact: Contact
    @Binding var showPicker: Bool
    @Binding var selectedContact: Contact
    
    var contactName: String {
        return "\(contact.firstName) \(contact.lastName)"
    }
    
    var body: some View {
        Button(action: {
            selectContact()
        }) {
            HStack {
                Text("\(contact.firstName)").fontWeight(.bold)
                Text("\(contact.lastName)")
            }
            .foregroundColor(.black)
        }
    }
    
    func selectContact() {
        self.selectedContact = contact
    }
}
