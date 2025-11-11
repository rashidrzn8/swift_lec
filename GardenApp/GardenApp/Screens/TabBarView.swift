//
//  TabBarView.swift
//  GardenApp
//
//  Created by Rashid Ahamed on 9/11/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            
            // Home Tab
            NavigationStack {
                ContentView()
            }
            .tabItem {
                Label("Home", systemImage: "leaf.fill")
            }
            
            // My Garden Tab
            NavigationStack {
                Text("My Garden")
            }
            .tabItem {
                Label("My Garden", systemImage: "house.fill")
            }
            
            // LadyBug Tab
            NavigationStack {
                Text("LadyBug")
            }
            .tabItem {
                Label("LadyBug", systemImage: "ladybug.fill") // Valid SF Symbol
            }
        }
    }
}

#Preview {
    TabBarView()
}
