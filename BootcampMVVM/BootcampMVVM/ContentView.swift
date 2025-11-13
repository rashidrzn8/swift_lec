//
//  ContentView.swift
//  BootcampMVVM
//
//  Created by Rashid Ahamed on 12/11/25.
//

import SwiftUI

struct ContentView: View {
    @State  var filmsViewModel = FilmViewModel()

    var body: some View {
        TabView{
            Tab("Home",systemImage: "movieclapper"){
                FilmsView(filmViewModel: filmsViewModel)
            }
            Tab("Favourites",systemImage: "heart.fill"){
                FavouriteScreen()
            }
            Tab("Settings",systemImage: "gear"){
                SettingScreen()
            }
            Tab(role:.search){
                Text("Search")
            }
        }
    }
}

#Preview {
    ContentView()
}
