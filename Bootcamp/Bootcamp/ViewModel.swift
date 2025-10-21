//
//  ViewModel.swift
//  Bootcamp
//
//  Created by Rashid Ahamed on 21/10/25.
//

import SwiftUI

struct Fruit :Identifiable {
    let id : String = UUID().uuidString
    let name:String
    let count:Int
    
}

class FruitViewModel :ObservableObject {
  @Published var fruitArray : [Fruit] = []
    
    func getFruits(){
        let fruit1 = Fruit(name: "banana", count: 12)
        let fruit2 = Fruit(name: "Papaya", count: 52)
        let fruit3 = Fruit(name: "Mango", count: 152)
        let fruit4 = Fruit(name: "Avacado", count: 112)
        
        fruitArray.append(fruit1)
        fruitArray.append(fruit2)
        fruitArray.append(fruit3)
        fruitArray.append(fruit4)
    }
    
    func deleteFood(index:IndexSet){
        fruitArray.remove(atOffsets: index)    }
    
}

struct ViewModel: View {
    
//    @State var fruitArray : [Fruit] = []
  @StateObject var fruitViewModel:FruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(fruitViewModel.fruitArray, id: \.id) { fruit in
                    HStack(spacing: 32){
                        Text("\(fruit.count)")
                            .foregroundColor(.orange)
                        Text(fruit.name)
                            .font(.headline)
                            .bold()
                    }
                }
                .onDelete(perform: fruitViewModel.deleteFood)
            }
            .listStyle(.insetGrouped)
            .navigationTitle(Text("Fruit List"))
            .onAppear{
                fruitViewModel.getFruits()
            }
        }
    }
    

}

#Preview {
    ViewModel()
}
