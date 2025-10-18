//
//  week3lecApp.swift
//  week3lec
//
//  Created by Rashid Ahamed on 18/10/25.
//

import SwiftUI

@main
struct week3lecApp: App {
    @StateObject var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
