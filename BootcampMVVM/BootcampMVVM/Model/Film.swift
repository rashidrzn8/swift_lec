//
//  Film.swift
//  BootcampMVVM
//
//  Created by Rashid Ahamed on 12/11/25.
//

import Foundation


struct Film:Codable, Identifiable, Hashable{
    
    let id: String
    let title: String
    let description: String
    let director: String
    let producer: String
    let releaseYear: String
    let score: String
    let duration: String
    let image: String
    let bannerImage: String
    let people: [String]

    enum CodingKeys: String, CodingKey {
        case id, title, description, director, producer, people
        case releaseYear = "release_date"
        case duration = "running_time"
        case score = "rt_score"
        case image = "image"
        case bannerImage = "movie_banner"
    }
}


