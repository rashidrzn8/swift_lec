//
//  FilmsView.swift
//  BootcampMVVM
//
//  Created by Rashid Ahamed on 13/11/25.
//

import SwiftUI

struct FilmsView: View {
    let filmViewModel:FilmViewModel
    
    var body: some View {
        NavigationStack{
            FilmsListView(filmModel: filmViewModel)
        }
        .task {
            await filmViewModel.fetchFilms()
        }
    }
}

#Preview {
    FilmsView(filmViewModel: FilmViewModel())
}
