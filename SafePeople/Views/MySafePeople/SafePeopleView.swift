//
//  SafePeopleView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/7/22.
//

import SwiftUI

struct SafePeopleView: View {
    @Environment(\.managedObjectContext) private var viewContext
    let defaultMsg = DefaultMessage()
    @EnvironmentObject private var userSettings: UserSettings
    @State var showSideBar: Bool = false
    @State var showAddContactView: Bool = false
    @State var showAddMessageView: Bool = false
    
    
    // Fetch Request
    @FetchRequest(entity: ContactsEntity.entity(), sortDescriptors: [])
    var persons: FetchedResults<ContactsEntity>
    
    
    
    // Functions
    func deletePerson(at offsets: IndexSet) {
        for index in offsets {
            let person = persons[index]
            viewContext.delete(person)
        }
        try? viewContext.save()
    }
    
    
    // Body
    var body: some View {
        
        NavigationView {
            
            
            VStack(alignment: .leading, spacing: 10) {
                
                // My Safe People
                Group {
                    HStack {
                        Text("My Safe People")
                            .font(.headline)
                            .foregroundColor(Color.accentColor)
                        Spacer()
                        
                        Button {
                            showAddContactView.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                        
                        
                    }
                    
                    // List Contacts
                    List {
                        ForEach(persons) { person in
                            ContactListItemView(person: person)
                            
                        }
                        .onDelete(perform: deletePerson(at:))
                        
                        if persons.count == 0 {
                            HStack {
                                Image(systemName: "exclamationmark.circle")
                                Text("Please add a Safe Person.")
                            }
                            .font(.headline)
                            .foregroundColor(Color.accentColor)
                            
                        }
                    }
                    
                } //: GROUP
                
                Spacer()
                
                // Custom Message
                Group {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Custom Message")
                                .font(.headline)
                                .foregroundColor(Color.accentColor)
                            Spacer()
                            
                            Button {
                                // edit message view
                                showAddMessageView.toggle()
                            } label: {
                                Text("edit")
                                    .font(.subheadline)
                            }
                            
                        }
                        
                        MessageCardView(text: userSettings.customMessage)
                            .padding()
                        
                        
                    }
                    
                    
                } //: GROUP
                
                
                Spacer()
                
                
                
                
                // Custom Message
                // Default Message
                // Ability to edit message
            }
            .padding()
            .sheet(isPresented: $showAddContactView) {
                AddContactView()
            }
            .sheet(isPresented: $showAddMessageView) {
                AddMessageView()
            }
            .background(Color.offWhite.edgesIgnoringSafeArea(.all))
            .onAppear() {
                              UITableView.appearance().backgroundColor = UIColor.clear
                              UITableViewCell.appearance().backgroundColor = UIColor.clear
                          }
        }
        
        
        
        
        
        
        
    }
    
}

struct SafePeopleView_Previews: PreviewProvider {
    static var previews: some View {
        SafePeopleView()
    }
}