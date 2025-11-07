//
//  ApiConfig.swift
//  MovieBrowsingApp
//
//  Created by Rashid Ahamed on 7/11/25.
//

import Foundation
struct APIConfig:Decodable{
    
    let tmdbBaseURL: String
    let tmdbAPIKey: String
    
    static let shared: APIConfig = {
        guard let url = Bundle.main.url(forResource: "APIConfig", withExtension: "json") else {
            fatalError("Api config file is missing in bundle")
        }
        
        do{
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(APIConfig.self, from: data)
        }catch{
            fatalError("Failed toi load ApiConfig")
        }
    }()
    
}
