//
//  DataController.swift
//  BookWorm
//
//  Created by David Lee on 6/19/22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let davidcontainer = NSPersistentContainer(name: "Bookworm")
    
    init() {
        davidcontainer.loadPersistentStores { description, err in
            if let err = err {
                print("Core Data failed to load: \(err.localizedDescription)")
            }
        }
    }
}
