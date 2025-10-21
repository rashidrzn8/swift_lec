//
//  Shapes.swift
//  Bootcamp
//
//  Created by Rashid Ahamed on 20/10/25.
//

import SwiftUI

struct Shapes: View {
    let backgroundColor :Color
    let count:Int
    let title:String
    
    init(fruit: Fruit, count: Int) {
        self.count = count
        
        if fruit == .apple{
            self.backgroundColor = .red
            self.title = "Apple"
        }else{
            self.backgroundColor = .orange
            self.title = "Orange"
        }
    }
    
    enum Fruit{
        case apple
        case orange
    }
    
    var body: some View {
        VStack(spacing: 12){
            Text("\(count)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .underline(true)
            Text(title)
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .frame(width: 150,height: 150)
        .background(backgroundColor)
        .cornerRadius(25)
            
    }
}

#Preview {
    HStack{
        Shapes(fruit: .apple, count: 1221)
        Shapes(fruit: .orange, count: 322)
    }
}
