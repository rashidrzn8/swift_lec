//
//  Erros.swift
//  MovieBrowsingApp
//
//  Created by Rashid Ahamed on 7/11/25.
//

import Foundation

enum APIConfigError: Error, LocalizedError{
    case fileNotFound
    case dataLoadingError(underlyingError:Error)
    case decodingError(underlyingError:Error)
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "File not found"
        case .dataLoadingError(underlyingError: let error):
            return "Data loading error: \(error.localizedDescription)"
        case .decodingError(underlyingError: let error):
            return "Decoding error: \(error.localizedDescription)"
        }
    }
    
    
}


enum NetworkError:Error, LocalizedError{
    case badURL(CTUnderlineStyle : Error)
    case missingConfiguration
    
    var errorDescription: String? {
        switch self {
        case  .badURL(CTUnderlineStyle: let error):
            return "Bad URL: \(error.localizedDescription)"
        case .missingConfiguration:
            return "Missing configuration"
        }
    }
}
