//
//  Product.swift
//  Ecomm
//
//  Created by Rashid Ahamed on 30/10/25.
//

import Foundation

struct Product : Identifiable{
    var id =  UUID()
    var name:String
    var image:String
    var description:String
    var supllier:String
    var price:Int
    
}

var productList = [
    Product(name: "Leather couch", image: "fn1", description: "An extra ordinary boy", supllier: "Ikea", price: 350),
    Product(name: "Silver couch", image: "fn2", description: "An extra ordinary boy", supllier: "Ikea", price: 350),
    Product(name: "Kooper couch", image: "fn3", description: "An extra dfsdfd ordinary boy", supllier: "Ikea", price: 350),

    Product(name: "Namether couch", image: "fn4", description: "An extra ordivsvdsnary boy", supllier: "Dell", price: 330),

    Product(name: "Grey couch", image: "fn5", description: "An extra ordinary boy", supllier: "Ikea", price: 350)

]
