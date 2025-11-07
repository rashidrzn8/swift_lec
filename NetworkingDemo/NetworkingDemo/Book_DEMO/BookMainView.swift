//
//  BookMainView.swift
//  NetworkingDemo
//
//  Created by Rashid Ahamed on 25/10/25.
//

import SwiftUI
import SwiftData

struct BookMainView: View {
    
    
  @State  private var isPresented:Bool = false
    
    
    @Environment(\.modelContext) var modelContext

    
    var body: some View {
        NavigationStack{
            List{
                Text("admoe")
                
            }
            .navigationTitle("Books")
            .sheet(isPresented:$isPresented) {
                AddBook()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isPresented = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.title2)
                    }
                }
                .navigationDestination(isPresented: $goToCart) {
                    CartPage()
                }
            }
        }
        
        
        
        
    }
}

#Preview {
    BookMainView()
}
