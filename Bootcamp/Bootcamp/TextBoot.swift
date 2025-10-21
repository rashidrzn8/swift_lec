//
//  TextBoot.swift
//  Bootcamp
//
//  Created by Rashid Ahamed on 20/10/25.
//

import SwiftUI

struct TextBoot: View {
    var body: some View {
        Text("Hello, WorldWorldWorldWorldWorldWorldWorldWorldWorldWorld!".capitalized)
//            .multilineTextAlignment(.leading)
//            .baselineOffset(10)
//            .padding()
        
            .frame(width: 300, height: 200, alignment: .center)
        
//            .bold()
//            .fontWeight(.bold)
//            .italic()
//            .foregroundColor(.red)
//            .padding()
//            .font(.system(size: 30))
    }
}

#Preview {
    TextBoot()
}
