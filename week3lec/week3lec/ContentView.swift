//
//  ContentView.swift
//  week3lec
//
//  Created by Rashid Ahamed on 18/10/25.
//

import SwiftUI

struct ContentView: View {

   @EnvironmentObject var viewModel: ViewModel
    @State var showsheet:Bool    = false
    
    var body: some View {
        VStack(spacing: 40) {
            Text("\(viewModel.count)")
                .font(.system(size: 50))
                .bold()
            
            // ✅ No need to pass viewModel manually
            ControlView()
            
            Button("show Sheet"){
                showsheet=true
            }
            .sheet(isPresented: $showsheet){
                PageNew()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel()) // ✅ inject ViewModel for preview
}
