//
//  Title.swift
//  MovieBrowsingApp
//
//  Created by Rashid Ahamed on 6/11/25.
//

import Foundation

struct APIObject:Decodable{
    var results:[Title] = []
}

struct Title :  Identifiable, Decodable{
    
    var id:Int
    var title:String?
    var name:String?
    var overview:String
    var postPath:String
}
