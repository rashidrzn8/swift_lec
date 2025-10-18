//
//  ControlView.swift
//  week3lec
//
//  Created by Rashid Ahamed on 18/10/25.
//

import SwiftUI

struct ControlView : View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack{
            Button("Increment"){
                viewModel.increment()
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .foregroundStyle(.white)
            .padding()
            .saturation(0.5)
            Button("Decrement"){
                viewModel.decrement()
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .foregroundStyle(.white)
            .padding()
            .saturation(0.5)
            Button("Reset"){
                viewModel.resetCount()
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .foregroundStyle(.white)
            .padding()
            .saturation(0.5)
            
        }
    }
    
}

#Preview {
    ControlView()
        .environmentObject(ViewModel())
}
