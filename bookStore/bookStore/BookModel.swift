//
//  BookModel.swift
//  bookStore
//
//  Created by Rashid Ahamed on 18/10/25.
//

import Foundation


struct Book: Identifiable {
    var id = UUID()             // ✅ auto-generate unique ID
    var title: String
    var author: String          // ✅ fixed typo
    var description: String
}
