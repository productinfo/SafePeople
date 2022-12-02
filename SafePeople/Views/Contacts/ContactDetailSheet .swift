//
//  ContactDetailSheet .swift
//  SafePeople
//
//  Created by Brittany Rima on 3/26/22.
//

import SwiftUI
import Contacts

struct ContactDetailSheet: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    let message = Message()
    var selectedContact: Contact
    @State var selectedNumberIndex = 0
    @Binding var showPickerView: Bool

    var fullName: String {
        return "\(selectedContact.firstName) \(selectedContact.lastName)"
    }
    
    var body: some View {
        VStack {
            Text(fullName)
            Picker("Numbers", selection: $selectedNumberIndex) {
                ForEach(selectedContact.phoneNumber, id: \.self)  { num in
                    Text(num ?? "")
                }
            }
            .pickerStyle(InlinePickerStyle())

            // Save Contact to core data
            Button {
                // Save to core data
                let newPerson = ContactsEntity(context: viewContext)
                newPerson.name = fullName
                newPerson.number = selectedContact.phoneNumber[selectedNumberIndex]
                newPerson.id = UUID()

                // Sends message to contact when added
                message.sendAddContactMsg(message: message.addContactMessage, phone: newPerson.number ?? "")
                
                // SAVE TO CORE DATA
                do {
                    try viewContext.save()
                    presentationMode.wrappedValue.dismiss()
                } catch {
                    print(error.localizedDescription)
                }

                showPickerView.toggle()
            } label: {
                Text("Save")
            }
        }
        .navigationTitle("\(selectedContact.firstName) \(selectedContact.lastName)")
    }
}
