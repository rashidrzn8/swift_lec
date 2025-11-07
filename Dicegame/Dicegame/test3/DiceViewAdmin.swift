//
//  DiceViewAdmin.swift
//  Dicegame
//
//  Created by Rashid Ahamed on 3/11/25.
//

import SwiftUI

struct DiceViewAdmin: View {
    @State private var numberOfPips:Int = 1
    @State private var isShowingAlert: Bool = false
    @Binding var adminScore:Int
    @State private var chances:Int = 1
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "die.face.\(numberOfPips)")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Text("\(numberOfPips)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
                
            }
            
            
            Button("Roll") {
                withAnimation {
                    for _ in 1...5 {
                        numberOfPips = Int.random(in: 1...6)
                        adminScore += numberOfPips
                    }
                    chances -= 1
                }
                
            }
            .disabled(chances == 0)
            .buttonStyle(.bordered)
            .padding(10)
            
            Text("The Score is \(adminScore)")
            
            Button("reset".uppercased()){
                adminScore = 0
                chances = 1
            }
            .disabled(adminScore == 0)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(12)
            .padding(.horizontal,12)
        }
        
        
    }
}

#Preview {
    DiceViewAdmin(adminScore: .constant(0))
}
