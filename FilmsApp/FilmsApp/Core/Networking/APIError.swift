//
//  ApiError.swift
//  FilmsApp
//
//  Created by Rashid Ahamed on 1/11/25.
//

import Foundation

enum APIError: LocalizedError   {
    
    case invalidURL
    case invalidResponse
    case decoding(Error)
    case networking(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid Response"
        case .decoding(let error):
            return error.localizedDescription
        case .networking(let error):
            return error.localizedDescription
        }
    }
    
    
}
