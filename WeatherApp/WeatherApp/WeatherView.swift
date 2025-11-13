//
//  ContentView.swift
//  WeatherApp
//
//  Created by Rashid Ahamed on 10/11/25.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        NavigationStack{
            ZStack {
                Color(.cyan.opacity(0.75))
                    .ignoresSafeArea(edges: .all)
                VStack(spacing: 0) {
                    Image(systemName: "cloud.sun.fill")
                        .resizable()
                        .scaledToFit()
                        .symbolRenderingMode(.multicolor)
                    Text("Wild Weather")
                        .font(.largeTitle)
                    Text("42*F")
                        .font(.system(size: 150))
                        .fontWeight(.thin)
                    
                    Text("Wind 10mph - Feels like 36*F")
                        .font(.title2)
                        .padding(.bottom)
                }
                .foregroundColor(.white)
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) {
                        Button{
                            //to so
                        }label: {
                            Image(systemName: "gear")
                        }
                        .tint(.white)
                    }
                }
            }
        }
    }
}

#Preview {
        WeatherView()
}
