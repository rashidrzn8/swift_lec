//
//  Movie.swift
//  Dicegame
//
//  Created by Rashid Ahamed on 6/11/25.
//

import Foundation
import SwiftData

@Model
class Movie{
    var title: String
    var releaseDate: Date
    
    init(title: String, releaseDate: Date) {
        self.title = title
        self.releaseDate = releaseDate
    }
    
}
