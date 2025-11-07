//
//  FirstView.swift
//  Dicegame
//
//  Created by Rashid Ahamed on 3/11/25.
//

import SwiftUI

struct FirstView: View {
    @State private var scoreboard = Scoreboard()
    private var startingScore: Int = 0
    @State private var newPlayerName: String = ""
    var body: some View {
        VStack{
            Text("Score keeper")
                .font(.largeTitle)
                .bold()
                .padding()
            Grid{
                GridRow{
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score" )
                }
                .bold()
                ForEach($scoreboard.players){$player in
                    GridRow{
                        TextField("Name", text: $player.name)
                        Text("\(player.score)")
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                        
                    }
                }
            }
            
            
            Button("add a player",systemImage: "plus"){
                scoreboard.players.append(Player(name: " ", score: 0))
            }
            
            VStack{
                TextField("Enter Player Name", text: $newPlayerName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Button("Add to the list"){
                    if !newPlayerName.isEmpty{
                        let newplayer = Player(name: newPlayerName, score: 0)
                        scoreboard.players.append(newplayer)
                        newPlayerName = ""
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
            
            Spacer()
            switch scoreboard.state {
            case .setup:
                Button("Start game",systemImage: "play.fill"){
                    scoreboard.state = .playing
                    scoreboard.reset(to: startingScore)
                }
            case .playing:
                Button("End Game",systemImage: "stop.fill"){
                    scoreboard.state = .gameOver
                }
            case .gameOver:
                Button("Restart",systemImage: "arrow.clockwise.circlepath"){
                    scoreboard.state = .setup
                }
            }
        }
    }
}

#Preview {
    FirstView()
}
