//
//  AddContactView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/12/22.
//

import SwiftUI
import iPhoneNumberField

struct AddContactView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @State var name: String = ""
    @State var number: String = ""
    
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
                
                
                NeumorphicStyleTextField(
                    textField: TextField("Name",
                    text: $name),
                    imageName: "person")
                
                
                iPhoneNumberField(text: $number)
                    .foregroundColor(.darkShadow)
                    .flagHidden(false)
                    .flagSelectable(true)
                    .maximumDigits(10)
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
                    //
                    //
                    
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
            
        
        
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView()
    }
}