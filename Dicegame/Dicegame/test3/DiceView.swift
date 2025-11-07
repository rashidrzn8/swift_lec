//
//  DiceView.swift
//  Dicegame
//
//  Created by Rashid Ahamed on 3/11/25.
//

import SwiftUI

struct DiceView: View {
    @State private var numberOfPips:Int = 1
    @State private var isShowingAlert: Bool = false
    @Binding var score:Int
    @State private var chances:Int = 5
    var body: some View {
        ZStack {
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
                        numberOfPips = Int.random(in: 1...6)
                        score += numberOfPips
                        chances -= 1
                        
                        if chances == 0 {
                            isShowingAlert = true
                        }
                    }
                    
                }
                .disabled(chances == 0)
                .buttonStyle(.bordered)
                .padding(10)
                
                Text("The Score is \(score)")
                
                Button("reset".uppercased()){
                    score = 0
                    chances = 5
                }
                .disabled(score == 0)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(12)
                .padding(.horizontal,12)
            }
            .background(Color.brown)
            .ignoresSafeArea(.all)
            .cornerRadius(12)
            .padding()
        }
        
        
    }
}

#Preview {
    DiceView(score: .constant(0))
}
