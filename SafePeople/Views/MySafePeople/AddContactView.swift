//
//  AddContactView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/12/22.
//

import SwiftUI
import iPhoneNumberField
import Contacts


struct AddContactView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    let message = Message()
    
    
    @State var name: String = ""
    @State var number: String = ""
    
// Contacts From Contact Book
   @State var showPicker = false
    @State var selectedContact: CNContact?
    @State var showContactNumberSheet = false
    
    var fullName: String {
        return String("\(selectedContact?.givenName) \(selectedContact?.familyName)")
    }
    
    
    var body: some View {
        
        
        VStack(spacing: 25) {
            
            HStack {
                Text("Add Safe Person")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.bottom, 40)
            
            HStack {
                Spacer()
                
                Button {
                    // show contacts
                    showPicker.toggle()
                } label: {
                    VStack(spacing: 0) {
                        Image(systemName: "person.crop.circle.fill.badge.plus")
                            .font(.title)
                            .padding(.horizontal)
                        Text("Contact List")
                            .font(.caption2)
                        
                    }
                }
                
            }
            
            
            // TextField
            NeumorphicStyleTextField(
                textField: TextField("Name",
                                     text: $name),
                imageName: "person")
            
            
            iPhoneNumberField(text: $number)
                .foregroundColor(.darkShadow)
                .flagSelectable(true)
                .maximumDigits(12)
                .padding()
                .foregroundColor(.neumorphictextColor)
                .background(Color.offWhite)
                .cornerRadius(6)
                .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
                .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
            
            
            
            
            
            
            Button {
                // CHECK FOR ERROR
                guard self.name != "" else {
                    return
                }
                
                // CREATE NEW PERSON IN CORE DATA
                let newPerson = ContactsEntity(context: viewContext)
                newPerson.name = name
                newPerson.number = number
                newPerson.id = UUID()
                
                // Sends message to contact when added
                message.sendAddContactMsg(message: message.addContactMessage, phone: number)
                
                
                // SAVE TO CORE DATA
                do {
                    try viewContext.save()
                    presentationMode.wrappedValue.dismiss()
                } catch {
                    print(error.localizedDescription)
                }
                
                // DISMISS VIEW
                
                
            } label: {
                Text("Save")
                    .font(.headline)
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                
            }
            .padding(.top, 40)
            Spacer()
            
        }
        .padding()
        .background(Color.offWhite)
        .sheet(isPresented: self.$showPicker) {
                    ContactPickerView(showPicker: self.$showPicker, selectedContact: $selectedContact)
                }
        .onChange(of: selectedContact) { selected in
           // Show sheet of contact info & ability to select number
            showContactNumberSheet.toggle()
        }
        .sheet(isPresented: $showContactNumberSheet) {
            ContactDetailSheet(contact: selectedContact!)
        }
     
       
     
    }
}


struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView()
    }
}
