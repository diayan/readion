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
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
     var body: some View {
         VStack {
             List(students) { student in
                 Text(student.name ?? "Unknown")
             }
             
             Button("Add") {
                 let firstNames = ["Ginny", "Harry", "Hermoine", "Luna", "Ron"]
                 let lastNames = ["Granger", "Lovel", "Potter", "Weasley"]
                 
                 let chosenFirstName = firstNames.randomElement()!
                 let chosenLastName = lastNames.randomElement()!
                 
                let student = Student(context: moc)
                 student.id = UUID()
                 student.name = "\(chosenFirstName) \(chosenLastName)"
                 
                 try? moc.save()
             }
         }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
