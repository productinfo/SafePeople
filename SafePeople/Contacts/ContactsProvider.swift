//
//  ContactsProvider.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/26/22.
//

import Foundation
import Contacts

class ContactsProvider {
    
    func fetchContacts() -> [Contact] {
        var contacts = [Contact]()
        let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        
        do {
            try CNContactStore().enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in
                let phoneNumberArrayString: [String] = contact.phoneNumbers.compactMap { (phoneNumber: CNLabeledValue) in
                    guard let number = phoneNumber.value.value(forKey: "digits") as? String else { return nil }
                    return number
                }
                
                contacts.append(Contact(firstName: contact.givenName, lastName: contact.familyName, phoneNumber: phoneNumberArrayString))
            })
        } catch let error {
            print("Failed to fetch contacts. \(error)")
        }
        
        contacts = contacts.sorted {
            $0.firstName < $1.firstName
        }
        
        return contacts
    }


    
    
    
    
}
