//
//  DefaultNetworkingService.swift
//  FilmsApp
//
//  Created by Rashid Ahamed on 1/11/25.
//

import Foundation


struct DefaultNetworkingService {
    
    func fetch<T: Decodable>(urlString: String, type: T.Type) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw ApiError.invalidURL
        }
        
        do {
            // ✅ Corrected tuple syntax: (data, response)
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // ✅ Check HTTP response validity
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw ApiError.invalidResponse
            }
            
            // ✅ Decode JSON into your model
            return try JSONDecoder().decode(type, from: data)
            
        } catch let error as DecodingError {
            throw ApiError.decoding(error)
        } catch {
            throw ApiError.networking(error)
        }
    }
    
    func fetchFilms() async throws -> [Film] {
        let url = "https://ghibliapi.vercel.app/films"
        return try await fetch(urlString: url, type: [Film].self)
    }
    
    func fetchPeople() async throws -> [Person] {
        let url = "https://ghibliapi.vercel.app/people"
        return try await fetch(urlString: url, type: [Person].self)
    }
}
