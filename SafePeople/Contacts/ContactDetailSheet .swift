//
//  ContactDetailSheet .swift
//  SafePeople
//
//  Created by Brittany Rima on 3/26/22.
//

import SwiftUI
import Contacts

struct ContactDetailSheet: View {
    var contact: CNContact
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    let message = Message()
    @State var selectedNumber: String = ""
    @State private var isSelected = false
    
    var fullName: String {
        return String(contact.givenName + contact.familyName)
    }
    
    var body: some View {
        VStack {
            Text(fullName)
            
            Picker("Numbers", selection: $selectedNumber) {
                ForEach(contact.phoneNumbers, id: \.self)  { number in
                    Text("\(number.value.stringValue)")
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
        .navigationTitle("\(contact.familyName)")
    }
}


