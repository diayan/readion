//
//  DataController.swift
//  readion
//
//  Created by diayan siat on 17/04/2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Readion")
    init() {
        container.loadPersistentStores(completionHandler: { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        })
    }
}
