//
//  Todo_appApp.swift
//  Todo_app
//
//  Created by Rashid Ahamed on 21/10/25.
//

import SwiftUI

@main
struct Todo_appApp: App {
    @StateObject private var listViewModel:ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TodoListApp()
            }.environmentObject(listViewModel)
        }
    }
}
