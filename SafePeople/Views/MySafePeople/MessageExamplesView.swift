//
//  MessageExamplesView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/15/22.
//

import SwiftUI

struct MessageExamplesView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                MessageExampleCardView(text: "Hi! I've hit my 'SAFE' button on the Safe People app because I'm really struggling with ___ and need to know I'm not alone.")
                
                MessageExampleCardView(text: "Hi! I've hit my 'SAFE' button on the Safe People app because I feel like giving up right now.")
                
                MessageExampleCardView(text: "Hi! I've hit my 'SAFE' button on the Safe People app because I'm feeling really tempted right now and need some support.")
                
                MessageExampleCardView(text: "Hi! I've hit my 'SAFE' button on the Safe People app because I'm dealing with anxiety right now and need someone to talk to.")
                
                MessageExampleCardView(text: "Hi! I've hit my 'SAFE' button on the Safe People app because I'm being tempted with food and need some accountability.")
                
                MessageExampleCardView(text: "Hi! I've hit my 'SAFE' button on the Safe People app because I feel like I'm falling apart and am reaching out for support.")
                
                MessageExampleCardView(text: "Hi! I've hit my 'SAFE' button on the Safe People app because I feel like giving up right now.")
                
                MessageExampleCardView(text: "Hi! I've hit my 'SAFE' button on the Safe People app because I've been triggered and in need of support.")
                
                MessageExampleCardView(text: "Hi! I've hit my 'SAFE' button on the Safe People app because I'm in a situation where I know I could easily be tempted or triggered.")
                
            }
            .padding()
        }
        .navigationTitle("Message Examples")
    }
        
}

struct MessageExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        MessageExamplesView()
    }
}
