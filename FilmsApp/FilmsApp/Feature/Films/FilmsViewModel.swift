//
//  FilmsViwModel.swift
//  FilmsApp
//
//  Created by Rashid Ahamed on 1/11/25.
//

import Foundation
import Observation

@Observable
class FilmsViewModel{
    var state:LoadingState<[Film]> = .idle
    
    private let service:DefaultNetworkingService
    
    init( service: DefaultNetworkingService = DefaultNetworkingService()) {
        self.service = service
    }
    
    func fetch() async  {
        state = .loading
        do{
            let films = try await service.fetchFilms()
            state = .loaded(films)
        }catch let error as ApiError {
            self.state = .error(error.errorDescription ?? "unknown error")
        }catch{
            self.state = .error("unknown error")
        }
    }
}
