//
//  Looop.swift
//  Bootcamp
//
//  Created by Rashid Ahamed on 20/10/25.
//

import SwiftUI

struct Looop: View {
    
    let data: [String] = ["hi","demo","swl","ddk"]
    let myString:String = "Hello"
    
    var body: some View {
        VStack{
            ForEach(data.indices) { index in
                Text("\(index) :   \(data[index ])")
            }
        }
    }
}

#Preview {
    Looop()
}
