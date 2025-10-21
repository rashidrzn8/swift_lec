//
//  AddView.swift
//  To-Do
//
//  Created by Rashid Ahamed on 21/10/25.
//

import SwiftUI

struct AddView: View {
    @State private var itemText:String = ""
    var body: some View {
        ScrollView{
            VStack{
                TextField("Add an item" ,text: $itemText )
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                
                Button("Save".uppercased()){
                    
                }
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(10)
                
                .font(.headline)
            }.padding(15)
            
        }
        .navigationTitle("Add an Item..")
    }
}

#Preview {
    NavigationView {
        AddView()
    }
   
}
