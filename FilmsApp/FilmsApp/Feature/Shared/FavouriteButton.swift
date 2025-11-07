//
//  FavouriteButton.swift
//  FilmsApp
//
//  Created by Rashid Ahamed on 1/11/25.
//

import SwiftUI

struct FavouriteButton: View {
    let filmID: String
        let favoritesViewModel: FavoritesViewModel
        
        var isFavorite: Bool {
            favoritesViewModel.isFavorite(filmID: filmID)
        }
        
        var body: some View {
            Button {
                favoritesViewModel.toggleFavorite(filmID: filmID)
            } label: {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(isFavorite ? Color.pink : Color.gray)
            }
        }
}

