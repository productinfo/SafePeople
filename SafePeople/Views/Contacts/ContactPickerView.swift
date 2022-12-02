//
//  ContactPickerView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/26/22.
//
import SwiftUI
import Contacts
import XCTest

struct ContactPickerView: View {
    @Binding var showPicker: Bool
    @State var selectedContact: Contact = Contact.init(firstName: "", lastName: "", phoneNumber: [""])
    let contactsProvider = ContactsProvider()
    @State var contacts = [Contact.init(firstName: "", lastName: "", phoneNumber: [""])]
    @State var showContactNumberSheet = false
    @State var selectedNumber: String = ""
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            List {
                ForEach (self.contacts.filter({ (cont) -> Bool in
                    self.searchText.isEmpty ? true :
                    "\(cont)".lowercased().contains(self.searchText.lowercased())
                })) { contact in
                    ContactRow(contact: contact, showPicker: $showPicker, selectedContact: $selectedContact)
                }
            }
            .onAppear() {
                self.requestAccess()
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("All Contacts".localized)
            .navigationBarItems(trailing: Button(action: {self.showPicker = false}, label: {
                Text("Cancel".localized)
            }))
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .sheet(isPresented: $showContactNumberSheet) {
                ContactDetailSheet(selectedContact: selectedContact, showPickerView: $showPicker)
            }
        }
        .onChange(of: selectedContact) { selected in
            // Show sheet of contact info & ability to select number
            showContactNumberSheet.toggle()
        }
    }

    func getContacts() {
        DispatchQueue.main.async {
            self.contacts = contactsProvider.fetchContacts()
        }
    }
    
    func requestAccess() {
        let store = CNContactStore()
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .authorized:
            self.getContacts()
        case .denied:
            store.requestAccess(for: .contacts) { granted, error in
                if granted {
                    self.getContacts()
                }
            }
        case .restricted, .notDetermined:
            store.requestAccess(for: .contacts) { granted, error in
                if granted {
                    self.getContacts()
                }
            }
        @unknown default:
            print("error")
        }
    }
}
