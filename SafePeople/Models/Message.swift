//
//  DefaultMessage.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/15/22.
//

import UIKit
import MessageUI
import SwiftUI


class Message {
    let addContactMessage = "Hi, I just added you as my 'Safe' person on the Safe People App. I will hit the 'safe' button to notify you when I am struggling."
    
    func sendMessage(message: String, phone: [String]) {
        let phoneString = phone.map { String($0) }
            .joined(separator: ",")
        let sms: String = "sms://open?addresses=\(phoneString)&body=\(message)"
        let strURL: String = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)
    }
    
    func sendAddContactMsg(message: String, phone: String) {
        let sms: String = "sms:\(phone)&body=\(message)"
        let strURL: String = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)
    }
}
