//
//  ViewModel.swift
//  bookStore
//
//  Created by Rashid Ahamed on 18/10/25.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var books: [Book] = []
    
    func addBook(title: String, author: String, description: String) {
        let book = Book(title: title, author: author, description: description) // ✅ fixed property name
        books.append(book)
    }
}
