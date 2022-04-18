//
//  readionApp.swift
//  readion
//
//  Created by diayan siat on 11/04/2022.
//

import SwiftUI

@main
struct readionApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
