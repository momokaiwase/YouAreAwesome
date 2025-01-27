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
    @State private var lastMessageNumber = -1 //lastMessageNumber will never be -1
    @State private var lastImageNumber = -1
    
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
                //generate random messageNumber to use as index
                //if messageNumber == lastMessageNumber {
                //keep generating messageNumber until messageNumber != lastMessageNumber
                //set messageString to messages[messageNumber]
                //update lastMessageNumber with messageNumber
                
                var messageNumber: Int
                repeat {
                    messageNumber = Int.random(in: 0...messages.count-1 )
                } while messageNumber == lastMessageNumber
                message = messages[messageNumber]
                lastMessageNumber = messageNumber
                
                var imageNumber = Int.random(in: 0...9)
                while imageNumber == lastImageNumber {
                    imageNumber = Int.random(in: 0...9)
                }
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                 
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
