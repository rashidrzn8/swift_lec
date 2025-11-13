//
//  DefaultNetworking.swift
//  BootcampMVVM
//
//  Created by Rashid Ahamed on 12/11/25.
//

import Foundation

struct DefaultNetworking{
    
    func fetchData<T:Decodable>(url:String, type:T.Type) async throws ->T{
        
        guard let url = URL(string: url) else {
            throw APIError.invalidURL
        }
        
        do{
            let (data,response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw APIError.invalidResponse
            }
            
            let decoder = JSONDecoder()
            return try decoder.decode(type, from: data)
            
        }catch let error as DecodingError{
            throw APIError.decodingFailed(error)
        }
    }
    
    
    func loadFilms() async throws ->[Film] {
        return try await fetchData(url: "https://ghibliapi.vercel.app/films", type: [Film].self)
    }
    
    func loadPersons(url:String) async throws -> Person {
        return try await fetchData(url: url, type: Person.self)
    }
    
}
