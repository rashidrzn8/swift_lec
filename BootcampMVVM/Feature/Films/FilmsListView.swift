//
//  FilmsListView.swift
//  BootcampMVVM
//
//  Created by Rashid Ahamed on 12/11/25.
//

import SwiftUI

struct FilmsListView: View {
  @State var filmModel = FilmViewModel()
    
    var body: some View {
        NavigationStack{
            switch filmModel.state {
            case .idle:
                Text("idle")
            case .loading:
                ProgressView()
            case .loaded:
                List(filmModel.films) { film in
                    NavigationLink(value: film) {
                        FilmRowView(film: film)
                    }
                }
                .navigationTitle("Rashids Movies")
                .listStyle(.plain)
                .navigationDestination(for: Film.self) { film in
                    FilmDetailScreen(film: film)
                }

                
            case .error:
                Text("Error")
            }
                
        }
        .task {
            await filmModel.fetchFilms()
        }
        
    }
}

#Preview {
    FilmsListView()
}

