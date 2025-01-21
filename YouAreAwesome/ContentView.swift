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
                let imageName1 = "hand.thumbsup"
                let imageName2 = "sun.max.fill"
                
//                if message == message1 {
//                    message = message2imageName = imageName2
//                } else {
//                    message = message1
//                    imageName = imageName2
//                }
                
                message = ( message == message1 ? message2 : message1)
                imageName = (imageName == imageName1 ? imageName2 : imageName1)
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
