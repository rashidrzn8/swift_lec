//
//  To_DoApp.swift
//  To-Do
//
//  Created by Rashid Ahamed on 21/10/25.
//

import SwiftUI

/*
MVVM architecture
 model - data point
 view - ui
 viewmodel - manages model for view
 
 */

@main
struct To_DoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TodoListApp()
            }
            
        }
    }
}
