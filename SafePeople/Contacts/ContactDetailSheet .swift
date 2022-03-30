//
//  ContactDetailSheet .swift
//  SafePeople
//
//  Created by Brittany Rima on 3/26/22.
//

import SwiftUI
import Contacts

struct ContactDetailSheet: View {
    var contact: Contact
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    let message = Message()
    @State var selectedNumber: String = ""
    @State private var isSelected = false
    
    var fullName: String {
        return "\(contact.firstName) \(contact.lastName)"
    }
    
    var body: some View {
        VStack {
            Text(fullName)
            
            Picker("Numbers", selection: $selectedNumber) {
                ForEach(contact.phoneNumber, id: \.self)  { num in
                    Text(num ?? "")
                }
            }
            .pickerStyle(InlinePickerStyle())
            
                
            
            // Save Contact to core data
            Button {
                // Save to core data
                let newPerson = ContactsEntity(context: viewContext)
                newPerson.name = fullName
                newPerson.number = selectedNumber
                newPerson.id = UUID()
                
                // Sends message to contact when added
                message.sendAddContactMsg(message: message.addContactMessage, phone: selectedNumber)
                
                
                // SAVE TO CORE DATA
                do {
                    try viewContext.save()
                    presentationMode.wrappedValue.dismiss()
                } catch {
                    print(error.localizedDescription)
                }
                
                // Dismiss View
                
            } label: {
                Text("Save")
            }
        }
        .navigationTitle("\(contact.firstName) \(contact.lastName)")
    }
}


