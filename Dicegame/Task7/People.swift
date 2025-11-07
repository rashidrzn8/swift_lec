//
//  People.swift
//  Dicegame
//
//  Created by Rashid Ahamed on 6/11/25.
//

import SwiftUI

struct People: View {
    var body: some View {
        TabView{
            Tab("People",systemImage: "person.and.person"){
                FriendList()
            }
            Tab("Movies",systemImage: "film.stack"){
                Text("Movies")
            }
        }
        .padding()
    }
}

#Preview {
    People()
        .modelContainer(for:Frnd.self,inMemory: true)
}
