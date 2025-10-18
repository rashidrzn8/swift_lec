//
//  PageNew.swift
//  week3lec
//
//  Created by Rashid Ahamed on 18/10/25.
//

import SwiftUI

struct PageNew: View {
    var body: some View {
        ZStack{
            Color(.cyan).edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Hello World!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Button("dismiss sheet"){
                    
                }.buttonStyle(.borderedProminent)
                    .padding(10)
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    PageNew()
}
