//
//  SwiftDataDemoApp.swift
//  SwiftDataDemo
//
//  Created by retxano on 13/9/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: DataItem.self)
    }
}
