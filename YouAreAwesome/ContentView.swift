//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Momoka Iwase on 2025/01/13.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "I Am A Programmer!"
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
                .frame(width: 200, height: 200) //200 x 200 box constraining the swift
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            
            Spacer()
            HStack {
                Button("Awesome!") {
                    message = "Awesome!"
                }
                Button("Great!") {
                    message = "Great!"
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
