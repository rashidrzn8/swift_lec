//
//  ListViewModel.swift
//  Todo_app
//
//  Created by Rashid Ahamed on 21/10/25.
//

import Foundation


class ListViewModel :ObservableObject {
    
    @Published var items:[ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems(){
        let newItems = [
        ItemModel(title: "one items", isCompleted: true),
        ItemModel(title: "second items", isCompleted: false),
        ItemModel(title: "thirsds items", isCompleted: true)]
        
        items.append(contentsOf: newItems)
        
    }
    
    func addItem(title:String){
        items.append(ItemModel(title: title, isCompleted: false))
    }
    
    func deleteItem(indexSet:IndexSet){
        items.remove(atOffsets:  indexSet )
    }
    
    func moveItem(from:IndexSet, to:Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func updateItem(item:ItemModel){
//       if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//       }{
//           
//       }
            
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.toggleCompletion()
        }
        
        
    }
    
    
}
