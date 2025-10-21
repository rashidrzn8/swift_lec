//
//  ItemModel.swift
//  Todo_app
//
//  Created by Rashid Ahamed on 21/10/25.
//

import Foundation

struct ItemModel: Identifiable {
    
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id:String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func toggleCompletion() -> ItemModel {
        ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
