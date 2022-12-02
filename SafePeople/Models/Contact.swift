//
//  Contact.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/30/22.
//

import Foundation
import Contacts

struct Contact: Identifiable, Equatable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var phoneNumber: [String?]
}

struct Number {
    let phoneNumber: String
}
