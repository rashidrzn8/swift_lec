//
//  BirthDay.swift
//  Dicegame
//
//  Created by Rashid Ahamed on 4/11/25.
//

import SwiftUI
import SwiftData 

struct BirthDay: View {
    @Query private var friends: [Friend]
    @Environment(\.modelContext) private var context
    
    @State private var newName:String = ""
    @State private var newDate:Date = Date.now
    var body: some View {
        NavigationStack{
            VStack{
                List(friends, id: \.name) { friend in
                    HStack{
                        Text(friend.name)
                        Spacer()
                        Text(friend.birthDay,format: .dateTime.month(.wide).day().year())
                    }
                }
            }
            .navigationTitle("BirthDay")
            .safeAreaInset(edge: .bottom) {
                VStack{
                    Text("New Birthday")
                    DatePicker(selection: $newDate , in: Date.distantPast...Date.now, displayedComponents: .date){
                        TextField("Name", text:$newName)
                    }
                    Button("save"){
                        let newFriend = Friend(name: newName, birthDay: newDate)
                        context.insert(newFriend)
                        newDate = Date.now
                        newName = "" 
                    }
                    .bold()
                    .buttonStyle(.borderedProminent)
                    
                }
                .padding(.horizontal,10)
            }
            .task {
                context.insert(Friend(name: "String", birthDay:Date.now))
            }
            
        }
       
    }
}

#Preview {
    BirthDay()
        .modelContainer(for:Friend.self, inMemory: true)
}
