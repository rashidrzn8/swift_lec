//
//  ContentView.swift
//  Dicegame
//
//  Created by Rashid Ahamed on 3/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isAdmin:Bool = false
    @State private var score:Int = 0
    @State private var adminScore:Int = 0
    @State private var diceCount:Int = 2
    var body: some View {
        VStack {
            Text("Dice roller ".uppercased())
                .font(.largeTitle)
                .bold()
            VStack{
                DiceView(score: $score)
                DiceViewAdmin(adminScore: $adminScore)
            }
            
            Text(score > adminScore ? "The winner is you" : "The winner is admin " )
        }
    }
}

#Preview {
    ContentView()
}
