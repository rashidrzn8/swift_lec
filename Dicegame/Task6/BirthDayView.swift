//
//  BirthDayView.swift
//  Dicegame
//
//  Created by Rashid Ahamed on 4/11/25.
//

import Foundation
import SwiftData

@Model
class Friend{
    var name:String
    var birthDay:Date
    
    init(name: String, birthDay: Date) { 
        self.name = name
        self.birthDay = birthDay
    }
}
