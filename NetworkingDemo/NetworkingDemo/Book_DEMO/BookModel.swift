//
//  BookModel.swift
//  NetworkingDemo
//
//  Created by Rashid Ahamed on 25/10/25.
//

import Foundation
import SwiftData

@Model
class Book {
    
    @Attribute(.unique) var id : UUID
    var title : String
    var author : String
    var summary : String
    var createdAt: Date
    
    init(id: UUID, title: String, author: String, summary: String, createdAt: Date) {
        self.id = id
        self.title = title
        self.author = author
        self.summary = summary
        self.createdAt = createdAt
    }
}
