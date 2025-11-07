//
//  NetworkingDemoApp.swift
//  NetworkingDemo
//
//  Created by Rashid Ahamed on 25/10/25.
//

import SwiftUI
import SwiftData

@main
struct NetworkingDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for:Book.self)
        }
    }
}
