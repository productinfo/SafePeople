//
//  StringExtension.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/26/22.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
