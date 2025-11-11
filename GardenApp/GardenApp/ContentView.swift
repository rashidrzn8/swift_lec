//
//  ContentView.swift
//  GardenApp
//
//  Created by Rashid Ahamed on 9/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var vegitables: [Vegetable] = []
    
    var body: some View {
        List(vegitables){veg in
            NavigationLink(destination: VegetableDetailScreen(vegetable: veg)) {
                VegetableCellView(vegetable: veg)
            }
        }
        .listStyle(.plain)
        .task {
            do{
                let client  = VegitableHTTPClient()
                vegitables = try await client.fetchVegitable()
            }catch{
                print(error.localizedDescription)
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
