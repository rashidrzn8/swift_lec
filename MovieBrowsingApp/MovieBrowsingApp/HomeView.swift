//
//  HomeView.swift
//  MovieBrowsingApp
//
//  Created by Rashid Ahamed on 6/11/25.
//

import SwiftUI

struct HomeView: View {
    var heroTestTitle : String  = "https://image.tmdb.org/t/p/w500/nnl6OWkyPpuMm595hmAxNW3rZFn.jpg"
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                LazyVStack{
                    AsyncImage(url: URL(string:heroTestTitle)){image in
                        image
                            .resizable()
                            .scaledToFill()
                            .overlay {
                                LinearGradient(
                                        stops: [Gradient.Stop(color:.clear,location: 0.8),Gradient.Stop(color:.gradient,location: 1)]
                                        , startPoint: .top,
                                        endPoint: .bottom)
                            }
                    }placeholder: {
                        ProgressView()
                    }
                    .frame(width: geo.size.width,height: geo.size.height*0.85)
                    
                    HStack{
                        Button{
                            
                        }label: {
                            Text("play")
                                .ghostButton()
                        }
                        Button{
                            
                        }label: {
                            Text("download")
                                .ghostButton()
                        }
                    }
                    HorizontalView(header: Constants.trendingMovieString)
                    HorizontalView(header: Constants.trendingMovieString)
                    HorizontalView(header: Constants.topRatedMovieString)
                    HorizontalView(header: Constants.topRatedTVString)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
