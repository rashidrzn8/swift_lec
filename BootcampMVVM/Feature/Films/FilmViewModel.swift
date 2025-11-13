//
//  FilmViewModel.swift
//  BootcampMVVM
//
//  Created by Rashid Ahamed on 12/11/25.
//

import Foundation
import Observation

@Observable
class FilmViewModel {
    
    var films:[Film] = []
    var state:Status = .idle
    var errorMessage:String?
    
    private let service:DefaultNetworking
    
    init(service:DefaultNetworking = DefaultNetworking()){
        self.service = service
    }
    
    func fetchFilms() async {
        state = .loading
        do{
            let fetchedFilms = try await service.loadFilms()
            films = fetchedFilms
            state = .loaded
            if fetchedFilms.isEmpty{
                errorMessage = "No films found"
                state = .error
            }
        }catch {
            errorMessage = error.localizedDescription
            state = .error
        }
    }
}

enum Status{
    case idle
    case loading
    case loaded
    case error
}

