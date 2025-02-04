//
//  ContentView.swift
//  CookieClickerTouchbar
//
//  Created by Donal Salin on 25/12/2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var CookieClick: CookieModel
    @State private var isMuted = false
    
    var body: some View {
        VStack {
            Text("Cookie Clicker")
                .font(.system(size: 45, weight: .heavy))
                .frame(maxWidth: 350)
                .shadow(radius: 4)
                .padding(.top, 30)
                .padding(30)
            
            // Counter
            Text("\(CookieClick.cookieCount())")
                .foregroundColor(Color.white)
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .padding(10)
                .shadow(radius: 4)
            
            // Cookie Button
            Button(action: {
                CookieClick.cookiePress()
            }) {
                Text("🍪")
                    .scaledToFit()
                    .font(.system(size: 45, weight: .heavy))
                    .frame(width: 150, height: 150)
            }
            .padding(10)
            
            // Reset Button
            Button(action: {
                CookieClick.resetCount()
            }) {
                Text("Reset Counter")
                    .scaledToFit()
                    .frame(width: 150, height: 50)
                    .font(.system(size: 20, weight: .heavy))
            }
            .padding(.bottom, 50)
            .padding(10)
        }
    }
}

//
//#Preview {
//    ContentView()
//}
