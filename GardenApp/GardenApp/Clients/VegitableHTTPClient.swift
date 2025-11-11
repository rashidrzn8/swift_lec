//
//  VegitableHTTPClient.swift
//  GardenApp
//
//  Created by Rashid Ahamed on 9/11/25.
//

import Foundation

struct VegitableHTTPClient{
    
    @MainActor
    func fetchVegitable() async throws -> [Vegetable] {
        
//        guard let url = URL(string: "http://azamsharp.com/vegetables.json") else{
//            throw APIError.invalidURL
//        }
        
        do{
            let (data,response ) = try await URLSession.shared.data(from: URL(string: "https://azamsharp.com/vegetables.json")!)
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200{
                throw APIError.invalidResponse
            }
            
            return try JSONDecoder().decode([Vegetable].self, from: data)
        }catch let error as DecodingError{
          throw  APIError.decodingFailed(error)
        }catch{
            throw error
        }
    }
}
