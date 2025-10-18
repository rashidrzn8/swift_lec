//
//  ContentView.swift
//  bookStore
//
//  Created by Rashid Ahamed on 18/10/25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @State var showSheet = false
    var body: some View {
        NavigationStack{
            VStack{
                ForEach(viewModel.books){ book in
                    VStack{
                        Text(book.title)
                        Text(book.author)
                        Text(book.description)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("add", systemImage: "plus"){
                        showSheet = true
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}
