//
//  FriendList.swift
//  Dicegame
//
//  Created by Rashid Ahamed on 6/11/25.
//

import SwiftUI
import SwiftData

struct FriendList: View {
    @Query(sort:\Frnd.name) private var frnds: [Frnd]
    @Environment(\.modelContext) private var context
    
    
    var body: some View {
        List{
            ForEach(frnds){frnd in
                Text(frnd.name)
            }
        }
        .task {
            context.insert(Frnd(name: "RAshid"))
            context.insert(Frnd(name: "sabith"))
        }
    }
}

#Preview {
    FriendList()
        .modelContainer(for:Frnd.self, inMemory: true)
}
