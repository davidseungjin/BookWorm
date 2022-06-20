//
//  BookWormApp.swift
//  BookWorm
//
//  Created by David Lee on 6/19/22.
//

import SwiftUI

@main
struct BookWormApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.davidcontainer.viewContext)
        }
    }
}
