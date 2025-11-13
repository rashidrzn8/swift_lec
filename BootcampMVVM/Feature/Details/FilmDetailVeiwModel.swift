//
//  FilmDetailVeiwModel.swift
//  BootcampMVVM
//
//  Created by Rashid Ahamed on 12/11/25.
//

import Foundation
import Observation

@Observable
class FilmDetailVeiwModel{
    
    var people:[Person] = []
    
    var state:Status = .loaded
    
    
    private let service:DefaultNetworking
    
    init(service:DefaultNetworking = DefaultNetworking()){
        self.service = DefaultNetworking()
    }
    
    func fetchPeople(film:Film) async {
        self.state = .loading
        var loadedPeople: [Person] = []
        
        do{
            try await withThrowingTaskGroup(of: Person.self) { group in
                for personInfo in film.people {
                    group.addTask {
                        try await self.service.loadPersons(url: personInfo)
                    }
                    for try await person in group {
                        loadedPeople.append(person)
                    }
                }
                
            }
            people = loadedPeople
            self.state = .loaded
        }
        catch{
            self.state = .error
        }
    }
    
}
