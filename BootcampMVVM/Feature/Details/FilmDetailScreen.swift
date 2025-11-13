//
//  FilmDetailScreen.swift
//  BootcampMVVM
//
//  Created by Rashid Ahamed on 12/11/25.
//

import SwiftUI

struct FilmDetailScreen: View {
    var film : Film
   @State private var filmDetailModel  = FilmDetailVeiwModel()
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                AsyncImage(url: URL(string: film.image)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                } placeholder: {
                    ProgressView()
                }
                
                Text(film.description)
                    .font(.caption)
                    .lineLimit(3)

                
                Divider()
                
                switch filmDetailModel.state {
                    case .idle:
                        Text("Loading...")
                    case .loading:
                        ProgressView()
                    case .loaded:
                    ForEach(filmDetailModel.people){ people in
                        Text(people.name)
                            .font(.title3)
                            .padding()
                    }
                        
                    case .error:
                        Text("Error")
                }
            }
        }
        .navigationTitle(film.title)
        .padding()
        .task {
            await filmDetailModel.fetchPeople(film: film)
        }
    }
}

