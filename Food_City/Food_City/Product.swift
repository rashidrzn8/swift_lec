//
//  Product.swift
//  Food_City
//
//  Created by Rashid Ahamed on 25/10/25.
//

import Foundation
import SwiftData

@Model
class Product{
    @Attribute(.unique) var id : UUID
    var title: String
    var image: String
    var price: Double
    var quanity: Int = 0
    
    init(id: UUID = .init(), title: String, image: String, price: Double, quanity: Int = 0) {
        self.id = id
        self.title = title
        self.image = image
        self.price = price
        self.quanity = quanity
    }
    
}
