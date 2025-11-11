//
//  SimplifiedFilmsScreen.swift
//  FilmsApp
//
//  Created by Rashid Ahamed on 8/11/25.
//

import Foundation
import Observation

enum SimplifiedFilmsScreen {
    case idle
    case loading
    case success
    case error
}

@Observable
class SimplifiedFilmsViewModel {
    
    var films: [Film] = []
    
    var errorMsg: String = ""
    var state :SimplifiedFilmsScreen = .idle
    
    private let service: DefaultNetworkingService

    init(service: DefaultNetworkingService = DefaultNetworkingService()) {
        self.service = service
    }
    
    func loadFilms() async {
        state = .loading
        do {
            let fetchedFilms = try await service.fetchFilms()
            films = fetchedFilms
            state = .success
        } catch {
            state = .error
        }
    }
}

