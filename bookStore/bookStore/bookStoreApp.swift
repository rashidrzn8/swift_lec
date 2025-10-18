//
//  bookStoreApp.swift
//  bookStore
//
//  Created by Rashid Ahamed on 18/10/25.
//

import SwiftUI

@main
struct bookStoreApp: App {
    @StateObject var viewModel:ViewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
