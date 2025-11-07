//
//  Content.swift
//  Dicegame
//
//  Created by Rashid Ahamed on 6/11/25.
//

import SwiftUI
import SwiftData

struct Content: App {
    var body: some Scene {
        WindowGroup{
            BirthDay()
                .modelContainer(for:Friend.self)
        }
    }
}

