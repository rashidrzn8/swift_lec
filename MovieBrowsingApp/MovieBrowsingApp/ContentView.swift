//
//  ContentView.swift
//  MovieBrowsingApp
//
//  Created by Rashid Ahamed on 6/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Tab("Home",systemImage: "house"){
                HomeView()
            }
            Tab("Upcoming",systemImage: "play.circle"){
                Text("upcoming")
            }
            Tab("Search",systemImage: "magnifyingglass"){
                Text("search")
            }
            Tab("Download",systemImage: "arrow.down.to.line"){
                Text("download")
            }
        }
    }
}

#Preview {
    ContentView()
}
