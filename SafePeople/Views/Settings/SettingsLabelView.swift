//
//  SettingsLabelView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/21/22.
//

import SwiftUI

struct SettingsLabelView: View {
    var labelText: String
    var labelImage: String
    
    var body: some View {
        HStack {
            Text(labelText.uppercased())
                .fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "Safe People", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
