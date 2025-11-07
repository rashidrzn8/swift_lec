//
//  AddBook.swift
//  NetworkingDemo
//
//  Created by Rashid Ahamed on 25/10/25.
//

import SwiftUI
import SwiftData

struct AddBook: View {
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var summary: String = ""
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Enter the title: ",text: $title)
                TextField("Enter the author: ",text: $author)
                TextField("Enter the summary: ",text: $summary)
                
                Button("save"){
                    let book = Book(id:UUID(), title: title, author: author, summary: summary, createdAt: Date())
                    
                     modelContext.insert(book)
                    
                    do{
                        try modelContext.save()
                    }catch {
                        print("error saving data: \(error)")
                    }
                }
            }
            .padding(.vertical, 10)
            .navigationTitle("Add book")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Exit"){
                        dismiss()
                    }
                }
            }
        }
     
    }
}

#Preview {
    AddBook()
}
