//
//  Extract.swift
//  Bootcamp
//
//  Created by Rashid Ahamed on 20/10/25.
//

import SwiftUI

struct Extract: View {
    
    @State var backgroundColor:Color = .green
   @State var isClicked:Bool = true
    var body: some View {
        ZStack{
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            //content
            
            VStack{
                Text ("Title")
                    .font(.title)
                    .frame(width: 150, height: 50)
                    .background(backgroundColor)
                
                Button("Click me!"){
                    isClicked.toggle()
                    backgroundColor = isClicked ? .red : .green
                }
                
                .buttonStyle(.borderedProminent)
                .tint(.black)
                
                
                
                    
            }
            
            
            
        } }
}

#Preview {
    Extract()
}
