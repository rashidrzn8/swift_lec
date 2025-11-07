//
//  Scoreboard.swift
//  Dicegame
//
//  Created by Rashid Ahamed on 3/11/25.
//

import Foundation

struct Scoreboard{
    var players = [
        Player(name: "Alisha", score: 12),
        Player(name: "Rashid", score: 12),
        Player(name: "demo", score: 11)
    ]
    
    var state = GameState.setup
    
    
    mutating func reset(to newValue: Int){
        for i in players.indices {
            players[i].score = newValue
        }
    }
}
