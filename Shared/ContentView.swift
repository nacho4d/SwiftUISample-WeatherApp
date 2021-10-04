//
//  ContentView.swift
//  Shared
//
//  Created by Guillermo Ignacio Enriquez Gutierrez on 2021/10/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
//            Color.purple
//                .ignoresSafeArea(SafeAreaRegions.all, edges: Edge.Set.top) //(.vertical) // Ignore just for the color
//                    .overlay(
//                        VStack(spacing: 20) {
//                            Text("Overlay").font(.largeTitle)
//                            Text("Example").font(.title).foregroundColor(.white)
//                    })
            LinearGradient(
                gradient: Gradient(colors: [Color.init(red: 0.1, green: 0.1, blue: 0.6), Color.blue]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
                .ignoresSafeArea(SafeAreaRegions.all, edges: [Edge.Set.top, .bottom])
//                .ignoresSafeArea()

                .edgesIgnoringSafeArea(Edge.Set.all)
            VStack {
                Text("Tokyo, Setagaya")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
