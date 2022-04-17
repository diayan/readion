//
//  ContentView.swift
//  readion
//
//  Created by diayan siat on 11/04/2022.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors , startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct ContentView: View {
   // @State private var remember = false
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
//        VStack {
//            PushButton(title: "Remember Me", isOn: $remember)
//            Text($remember ? "On" : "Off")
//        }
        
        NavigationView {
            TextEditor(text: $notes)
                .navigationTitle("notes")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
