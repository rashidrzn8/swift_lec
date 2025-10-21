//
//  ListRowView .swift
//  To-Do
//
//  Created by Rashid Ahamed on 21/10/25.
//

import SwiftUI

struct ListRowView: View {
    
    let item:ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    var item1 = ItemModel(title: "ddd", isCompleted: false)
    Group{
        ListRowView(item: item1)
    }
    .previewLayout(.sizeThatFits)
}
