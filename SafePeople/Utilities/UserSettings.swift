//
//  UserSettings.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/15/22.
//

import Foundation

class UserSettings: ObservableObject {
    let defaultMessage = "Hi! I've hit my 'SAFE' button on the Safe People app because I'm struggling and am in need of some support."
    
    @Published var customMessage: String {
        didSet {
            UserDefaults.standard.set(customMessage, forKey: "customMessage")
        }
    }
    
    init() {
        self.customMessage = UserDefaults.standard.object(forKey: "customMessage") as? String ?? defaultMessage
    }
}
