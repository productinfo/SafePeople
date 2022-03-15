//
//  AppTitleView.swift
//  Triggered
//
//  Created by Brittany Rima on 3/6/22.
//

import SwiftUI

struct AppTitleView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Safe")
            
            HStack(spacing: 0) {
                Text("people")
                Text(".")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
            }
        }
        .font(.system(size: 25, weight: .semibold, design: .rounded))
        .foregroundColor(Color.accentColor)
    }
}

struct AppTitleView_Previews: PreviewProvider {
    static var previews: some View {
        AppTitleView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
