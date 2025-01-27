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
    @State private var imageNumber = 0
    @State private var messageNumber = 0
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: message)
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)

            Spacer()
            Button("Show Message") {
                let messages = ["You Make Me Smile!", "When the Genius Bar Needs Help, They Call You!",
                                "You are Great!",
                                "You are Fantastic",
                                "Fabulous? That's You!"
                ]
                
                message = messages[messageNumber]
                messageNumber += 1
                if messageNumber == messages.count {
                    messageNumber = 0
                }
                
//                message = (message == message1 ? message2 : message1)
//                imageName = (imageName == "image0" ? "image1": "image0")
                
                imageName = "image\(imageNumber)"
                
                imageNumber += 1
                if imageNumber > 9 {
                    imageNumber = 0
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

//cmd A selects everything, ctrl I to fix indentation
