//
//  NewBook.swift
//  bookStore
//
//  Created by Rashid Ahamed on 18/10/25.
//

import SwiftUI

struct NewBook: View {
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var description: String = ""
    var body: some View {
        VStack{
            HStack{
                Text("Title: ")
                    .frame(width: 150,height: 50)
                    .font(.system(size: 30))
                TextField("Tite" , text:$title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.headline)
                    .tint(.blue)
                    .frame(width: 150,height: 50)
            }
            HStack{
                Text("Auther: ")
                    .frame(width: 150,height: 50)
                    .font(.system(size: 30))
                TextField("Auther" , text:$author)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.headline)
                    .tint(.blue)
                    .frame(width: 150,height: 50)
            }
            HStack{
                Text("Description: ")
                    .frame(width: 150,height: 50)
                    .font(.system(size: 30))
                TextField("Description" , text:$description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.headline)
                    .tint(.blue)
                    .frame(width: 150,height: 50)
            }
           
            
        }
    }
}

#Preview {
    NewBook()
}
