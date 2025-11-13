//
//  InfoRow.swift
//  FilmsApp
//
//  Created by Rashid Ahamed on 8/11/25.
//

import SwiftUI

struct InfoRow: View {
    let label:String
    let value:String
    var body: some View {
        GridRow{
            Text(label)
                .font(.caption)
                .bold(true)
                .frame(width: 100,alignment: .leading)
            Text(value)
                .font(.caption)
        }
    }
}

