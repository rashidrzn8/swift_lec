//
//  APIError.swift
//  BootcampMVVM
//
//  Created by Rashid Ahamed on 12/11/25.
//

import Foundation


enum APIError:Error{
    
    case invalidURL
    case invalidResponse
    case decodingFailed(Error)
    case noData
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid Response"
        case .decodingFailed(let error):
            return error.localizedDescription
        case .noData:
            return "No Data"
        }
    }
}
