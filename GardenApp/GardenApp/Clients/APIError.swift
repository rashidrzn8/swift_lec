//
//  APIError.swift
//  GardenApp
//
//  Created by Rashid Ahamed on 9/11/25.
//

import Foundation


enum APIError:Error{
    case invalidResponse
    case decodingFailed(Error)
    case invalidURL
    case networkingFailed
    
    var localizedDescription: String {
        switch self {
        case .invalidResponse:
            return "Invalid Response"
        case .decodingFailed(let error):
            return "Decoding Failed: \(error.localizedDescription)"
        case .invalidURL:
            return "Invalid URL"
        case .networkingFailed:
            return "Networking Failed"
        }
    }
}
