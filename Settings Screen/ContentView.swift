//
//  ContentView.swift
//  Settings Screen
//
//  Created by Yashwanth V on 03/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var playSounds = false
    @State private var sendReadReceipts = true
    @State private var notifyAbout = "Direct messages"
    @State private var imageSize = "Medium"
    var imageSizeDescription: String {
        switch imageSize {
        case "Small":
            return "Small profile images show more messages on screen at once."
        case "Medium":
            return "Medium balances image size and how many messages fit."
        case "Large":
            return "Large profile images are easier to see, but fewer messages fit."
        default:
            return ""
        }
    }
    
    var body: some View {
        NavigationStack{
            Form{
                
                Section("Notifications")
                {
                    Picker("Notify Me About:", selection: $notifyAbout) {
                        Text("All messages").tag("All messages")
                        Text("Direct messages").tag("Direct messages")
                        Text("Mentions").tag("Mentions")
                    }
                    Toggle("Play Notification Sounds", isOn: $playSounds)
                    Toggle("Send Read Receipts", isOn: $sendReadReceipts)
                }
                Section("User Profiles") {
                    NavigationLink {
                        Form {
                            Section{
                                Picker("Size", selection: $imageSize) {
                                    Text("Small").tag("Small")
                                    Text("Medium").tag("Medium")
                                    Text("Large").tag("Large")
                                }.pickerStyle(.inline).labelsHidden()
                            } footer: {
                                    Text(imageSizeDescription)
                                }
                        }
                    } label: {
                        LabeledContent("Profile Image Size", value: imageSize)
                    }
                }
                
                    
                }  .navigationTitle("Settings")

                
            }
        
        }
}


#Preview {
    ContentView()
}
