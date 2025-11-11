//
//  VegetableCellView.swift
//  GardenApp
//
//  Created by Rashid Ahamed on 9/11/25.
//

import SwiftUI

struct VegetableCellView: View {
    let vegetable:Vegetable 
    var body: some View {
        HStack(spacing: 12){
            AsyncImage(url: vegetable.thumbnailImage) { image in
                ZStack{
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 85, height: 85)
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(.circle)
                        .frame(width: 75, height: 75)
                }
            } placeholder: {
                ZStack{
                    Circle()
                        .frame(width: 85, height: 85)
                }
            }
            
            VStack(alignment: .leading){
                Text(vegetable.name)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(vegetable.body)
                    .font(.caption)
                    .lineLimit(2)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    VegetableCellView(vegetable: PreviewData.loadVegetables()[0])
}
