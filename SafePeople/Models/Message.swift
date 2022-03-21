//
//  DefaultMessage.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/15/22.
//

import Foundation
import UIKit

class Message {
    let addContactMessage = "This is the message that will send when you add a contact."
    
    func sendMessage(message: String, phone: [String]) {
        let sms: String = "sms:\(phone)&body=\(message)"
        let strURL: String = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)
    }
    
    func sendAddContactMsg(message: String, phone: String) {
        let sms: String = "sms:\(phone)&body=\(message)"
        let strURL: String = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)
    }
}
