//
//  UserSettings.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/15/22.
//

import Foundation

class UserSettings: ObservableObject {
    @Published var customMessage: String {
        didSet {
            UserDefaults.standard.set(customMessage, forKey: "customMessage")
        }
    }
    
    init() {
        self.customMessage = UserDefaults.standard.object(forKey: "customMessage") as? String ?? ""
    }
}
