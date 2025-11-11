//
//  Product.swift
//  ECOM
//
//  Created by Rashid Ahamed on 8/11/25.
//

import Foundation


struct Product:Codable,Identifiable,Hashable{
    let id: UUID = UUID()
    let name : String
    let price : Double
    let image:String
    let description:String
}
