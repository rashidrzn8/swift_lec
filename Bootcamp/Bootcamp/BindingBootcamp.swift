//
//  BindingBootcamp.swift
//  Bootcamp
//
//  Created by Rashid Ahamed on 20/10/25.
//

import SwiftUI

struct BindingBootcamp: View {
    @State var backgroundColor:Color = .black
    var body: some View {
        ZStack{
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            subViewDemonstration(backgroundColor: $backgroundColor)
        }
    }
}

struct subViewDemonstration: View {
    
    @Binding var backgroundColor:Color
    @State private var isClicked: Bool = false
    
    var body: some View {
        VStack{
            Button("Click me!"){
                backgroundColor = isClicked ? .black : .white
                isClicked.toggle()
            }.foregroundStyle(.white)
                .font(.largeTitle)
                .buttonStyle(.borderedProminent)
                .tint(.blue)
        }
    }
}

#Preview {
    BindingBootcamp()
}
