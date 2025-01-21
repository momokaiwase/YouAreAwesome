//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Momoka Iwase on 2025/01/13.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            
            Spacer()
            Button("Press Me!") {
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
                if message == message1 {
                    message = message2
                    imageName = "hand.thumbsup"
                } else {
                    message = message1
                    imageName = "sun.max.fill"
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


//cmd A selects everything, ctrl I to fix indentation
