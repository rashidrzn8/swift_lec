//
//  TodoListApp.swift
//  To-Do
//
//  Created by Rashid Ahamed on 21/10/25.
//

import SwiftUI

struct TodoListApp: View {
    @State var items : [String] = [
        "this is the first title",
        "this is the second title"
    ]
    var body: some View {
        List{
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarItems(leading: EditButton(),
                            trailing: NavigationLink("Add", destination: AddView()))
    }
}

#Preview {
    NavigationView {
        TodoListApp()
    }
    
}


