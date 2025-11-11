//
//  ContentView.swift
//  ECOM
//
//  Created by Rashid Ahamed on 8/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.secondary
                .opacity(0.2)
                
                .edgesIgnoringSafeArea(.all)
            VStack {
                ProductListView()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
