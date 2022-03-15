//
//  AddMessageView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/15/22.
//

import SwiftUI

struct AddMessageView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @State var message: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                // TITLE
                Group {
                    HStack {
                        Text("Add Custom Message")
                            .font(.title)
                        .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(.horizontal)
                }
                
                // INFORMATION
                Group {
                 
                    VStack(spacing: 10) {
                           InfoCardView()
                                .padding()
                            
                        Spacer()
                        
                                Text("New Message")
                                    .font(.headline)
                                .foregroundColor(Color.accentColor)
                             
                                
                                Text(message != "" ? message : "Create new message below.")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.secondary)
                                    .padding(.horizontal)
                                    
                        
                           
                            
                            
                        NeumorphicStyleTextField(textField: TextField("New Custom Message", text: $message), imageName: "plus.message")
                            .padding()
                            
                            
                            Button {
                                // Save to core data
                                guard self.message != "" else {
                                    return
                                }
                                
                                let newMessage = MessageEntity(context: viewContext)
                                newMessage.message = message
                                
                                do {
                                    try viewContext.save()
                                    presentationMode.wrappedValue.dismiss()
                                } catch {
                                    print(error.localizedDescription)
                                }
                            
                            } label: {
                                Text("Save")
                                    .font(.headline)
                                    .padding()
                                    .background(Color.accentColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                            }
                    }
                    .padding()
                    Spacer()
                } //: GROUP
                
            }
            .background(Color.offWhite)
        }
        
    }
}

struct AddMessageView_Previews: PreviewProvider {
    static var previews: some View {
        AddMessageView()
    }
}
