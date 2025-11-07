//
//  Search.swift
//  Ecomm
//
//  Created by Rashid Ahamed on 30/10/25.
//

import SwiftUI

struct Search: View {
    @State private var search:String = ""
    var body: some View {
        HStack{
            HStack{
                Image(systemName: "magnifyingglass")
                    .padding(.leading)
                
                TextField("Search for a furniture", text:$search)
                    .padding()
                
                    
            }
            .background(Color("kSecondary"))
            .cornerRadius(12)
            
            Image(systemName: "camera")
                .padding()
                .foregroundColor(.white)
                .background(Color("kPrimary"))
                .cornerRadius(12)
                        
        }
        .padding(.horizontal)
    }
}

#Preview {
    Search()
}
