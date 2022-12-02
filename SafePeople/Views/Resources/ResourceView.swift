//
//  ResourceView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/11/22.
//

import SwiftUI

struct ResourceView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                Group {
                    ResourceRowView(name: "Suicide Hotline", content: "1-800-273-8255")
                    ResourceRowView(name: "Domestic Violence Hotline", content: "1-800-799-7233")
                    ResourceRowView(name: "Veteran's Crisis Line", content: "1-800-273-8255")
                    ResourceRowView(name: "Find Treatment", linkLabel: "Website", linkDestination: "www.findtreatment.gov/")
                }
                Group {
                    ResourceRowView(name: "Alcoholics Anonymous", linkLabel: "Website", linkDestination: "www.aa.org/")
                    ResourceRowView(name: "Narcotics Anonymous", linkLabel: "Website", linkDestination: "www.na.org")
                    ResourceRowView(name: "Overeaters Anonymous", linkLabel: "Website", linkDestination: "www.oa.org")
                    ResourceRowView(name: "Sexaholics Anonymous", linkLabel: "Website", linkDestination: "www.sa.org")
                    ResourceRowView(name: "Pure Desire Ministries", linkLabel: "Website", linkDestination: "www.puredesire.org")
                    ResourceRowView(name: "Suicide Prevention Lifeline", linkLabel: "Website", linkDestination: "www.suicidepreventionlifeline.org")
                    ResourceRowView(name: "Sarah Peters", linkLabel: "Website", linkDestination: "www.sarahjpeters.org")
                }
                Divider()
                    .padding(.vertical, 4)
                Spacer()
            }
        }
        .navigationTitle("Resources")
    }
}

struct ResourceView_Previews: PreviewProvider {
    static var previews: some View {
        ResourceView()
    }
}
