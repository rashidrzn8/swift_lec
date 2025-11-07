//
//  LoadingState.swift
//  FilmsApp
//
//  Created by Rashid Ahamed on 1/11/25.
//

import Foundation

enum LoadingState <T:Equatable>: Equatable {
    case loading
    case loaded(T)
    case idle
    case error(String)
    
    var isLoading:Bool{
        if case .loading = self{
            return true
        }else{
            return false
        }
    }
    
    var data:T?{
        if case .loaded(let value) = self {
            return value
        }
        else{
            return nil
        }
    }
    
    var error:String?{
        if case .error(let value) = self {
            return value
        }else{
            return nil
        }
    }
    
}
