//
//  TodoListApp.swift
//  To-Do
//
//  Created by Rashid Ahamed on 21/10/25.
//

import SwiftUI

struct TodoListApp: View {
    @EnvironmentObject private var listViewModel: ListViewModel
    var body: some View {
        List{
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear){
                            listViewModel.updateItem(item: item)
                        }
                    }
                
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
            
                
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
    }.environmentObject(ListViewModel())
    
}


