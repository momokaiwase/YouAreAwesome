//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Momoka Iwase on 2025/01/13.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1 //lastMessageNumber will never be -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    @State private var soundIsOn = true
    let numberOfImages = 10 //images labeled 0 to 9
    let numberOfSounds = 6 //labeled 0 to 5
    
    
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
            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            HStack {
                Text("Sound On:")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) {
                        if audioPlayer != nil && audioPlayer.isPlaying {
                            audioPlayer.stop()
                        }
                    }
                    
                
                Spacer()
                
                Button("Show Message") {
                    let messages = ["You Make Me Smile!", "When the Genius Bar Needs Help, They Call You!",
                                    "You are Great!",
                                    "You are Fantastic",
                                    "Fabulous? That's You!"
                    ]
                    
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBound: messages.count-1)
                    message = messages[lastMessageNumber]
                    
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBound: numberOfImages-1)
                    imageName = "image\(lastImageNumber)"
                    
                    
                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBound: numberOfSounds-1)
                    imageName = "image\(lastImageNumber)"
                    if soundIsOn {
                        playSound(soundName: "sound\(lastSoundNumber)")
                    }
                    
                    
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
            .tint(.accentColor)
            
        }
        .padding()
    }
    
    func nonRepeatingRandom (lastNumber: Int, upperBound: Int) -> Int{
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...(upperBound))
        } while newNumber == lastNumber
        return newNumber
    }
    func playSound(soundName: String) {
        if audioPlayer != nil && audioPlayer.isPlaying {
            audioPlayer.stop()
        }
        guard let soundFile = NSDataAsset(name: soundName)else {
            print("😡 Could not read file named \(soundName)") //ctrl cmd space to insert emoji
            return }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 Error: \(error.localizedDescription) creating audioPlayer")
        }
    }
}

#Preview ("Light Mode"){
    ContentView()
        .preferredColorScheme(.light)
}

#Preview ("Dark Mode"){
    ContentView()
        .preferredColorScheme(.dark)
}

//cmd A selects everything, ctrl I to fix indentation
