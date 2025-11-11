//
//  SimplifiedScree.swift
//  FilmsApp
//
//  Created by Rashid Ahamed on 8/11/25.
//

import SwiftUI

struct SimplifiedScree: View {
    @State  var viewModel = SimplifiedFilmsViewModel()
    var body: some View {
        VStack{
            switch viewModel.state {
            case .idle:
                Text("Idle")
            case .loading:
                ProgressView()
            case .success:
                List(viewModel.films) { film in
                    Text(film.title)
                }
            case .error:
                Text(viewModel.errorMsg)
            }
        }
        .task {
            await viewModel.loadFilms()
        }
    }
}

#Preview {
    SimplifiedScree()
}
