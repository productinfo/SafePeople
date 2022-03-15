//
//  HalfSheetView.swift
//  SafePeople
//
//  Created by Brittany Rima on 3/12/22.
//
import SwiftUI
// use with ZStack

struct HalfSheetView: View {
    @Binding var sheetIsShowing: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.0)
                
                VStack {
                    Spacer()
                    
                    VStack {
                        Rectangle()
                            .frame(height: geo.size.height - 150)
                            .cornerRadius(30, antialiased: false)
                            .foregroundColor(Color.accentColor)
                            .offset(x: 0, y: sheetIsShowing ? 0 : 1000 )
                            .animation(Animation.easeInOut.speed(2), value: sheetIsShowing)
                    }
                    
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}


