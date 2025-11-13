//
//  FilmRowView.swift
//  BootcampMVVM
//
//  Created by Rashid Ahamed on 12/11/25.
//

import SwiftUI

struct FilmRowView: View {
    var film : Film
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: film.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
            } placeholder: {
                ProgressView()
            }
            
            VStack (alignment: .leading) {
                Text(film.title)
                    .bold()
                
                Text(film.description)
                    .font(.caption)
                    .lineLimit(2)
            }
            
        }
        .padding()
    }
}

