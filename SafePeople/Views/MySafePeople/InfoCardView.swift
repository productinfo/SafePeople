//
//  InfoCardView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/15/22.
//

import SwiftUI

struct InfoCardView: View {
    var body: some View {
            VStack {
                HStack {
                    Image(systemName: "info.circle")
                        .font(.headline)
                    
                    Spacer()
                    
                    NavigationLink {
                        MessageExamplesView()
                    } label: {
                        HStack {
                            Text("see examples")
                                .font(.subheadline)
                            Image(systemName: "arrow.right.circle")
                        }
                    }
                    
                    
                }
                .padding(.bottom)
                .foregroundColor(Color.accentColor)
                
                Text("This is the message that will be sent to your Safe People when you hit the Safe Button. We recommend you customize this message to fit whatever it is that you are struggling with. If you need help coming up with a message, check out our examples.")
                    .italic()
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(.thinMaterial)
            .cornerRadius(6)
        
    }
}

struct InfoCardView_Previews: PreviewProvider {
    static var previews: some View {
        InfoCardView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
