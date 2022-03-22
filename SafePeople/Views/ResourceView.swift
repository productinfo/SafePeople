//
//  ResourceView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/11/22.
//

import SwiftUI

struct ResourceView: View {
    var body: some View {
       
            VStack(alignment: .leading) {
                Group {
                    HStack {
                        Text("Here are a few resources you may find helpful.")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                       
                        Spacer()
                        
                        Image(systemName: "book.circle")
                            .font(.title)
                            .foregroundColor(.accentColor)
                    }
                    .padding()
                    
        }
       
            Group {
                ResourceRowView(name: "Suicide Hotline", content: "1-800-273-8255")
               
                 ResourceRowView(name: "Alcoholics Anonymous", linkLabel: "Website", linkDestination: "www.aa.org/")
                 
                 ResourceRowView(name: "Pure Desire Ministries", linkLabel: "Website", linkDestination: "www.puredesire.org")
                
                 ResourceRowView(name: "Domestic Violence Hotline", content: "1-800-799-7233")
                 
                 ResourceRowView(name: "Veteran's Crisis Line", content: "1-800-273-8255")
                 
                 ResourceRowView(name: "Find Treatment", linkLabel: "Website", linkDestination: "www.findtreatment.gov/")
                Divider()
                    .padding(.vertical, 4)
            }
         
            Spacer()
        }
        
        .navigationTitle("Resources")
        
            
    }
}

struct ResourceView_Previews: PreviewProvider {
    static var previews: some View {
        ResourceView()
    }
}
