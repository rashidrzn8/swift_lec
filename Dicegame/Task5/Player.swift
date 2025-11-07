//
//  Player.swift
//  Dicegame
//
//  Created by Rashid Ahamed on 3/11/25.
//

import Foundation
struct Player:Identifiable{
    
    var id = UUID()
    var name:String
    var score:Int = 0
    
    init(id: UUID = UUID(), name: String, score: Int) {
        self.id = id
        self.name = name
        self.score = score
    }
}
