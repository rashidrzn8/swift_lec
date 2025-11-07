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
    
     
}
