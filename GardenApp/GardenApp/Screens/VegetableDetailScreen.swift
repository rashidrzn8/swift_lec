//
//  VegetableDetailScreen.swift
//  GardenApp
//
//  Created by Rashid Ahamed on 9/11/25.
//

import SwiftUI

struct VegetableDetailScreen: View {
    @State private var isSelected:Bool = false
    let vegetable:Vegetable
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: vegetable.thumbnailImage) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                        .cornerRadius(16)
                        
                } placeholder: {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 200, height: 200)
                }
                
                Text(vegetable.body)
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineSpacing(4)
                    .padding(.bottom,8)
                
                Divider()
                Text("Quick Facts")
                    .font(.title3)
                    .bold()
                DetailRow(icon: "leaf", title: "Seed Depth", value: vegetable.seedDepth)
                DetailRow(icon: "thermometer", title: "Germination Temp", value: vegetable.germinationSoilTemp)
                DetailRow(icon: "calendar", title: "Days to Germination", value: "\(vegetable.daysToGermination) days")
                DetailRow(icon: "sun.max", title: "Light Requirement", value: vegetable.light)
                DetailRow(icon: "drop", title: "Watering", value: vegetable.watering)
                DetailRow(icon: "leaf.arrow.triangle.circlepath", title: "Companions", value: vegetable.goodCompanions)
                DetailRow(icon: "exclamationmark.triangle", title: "Bad Companions", value: vegetable.badCompanions)
                DetailRow(icon: "heart.fill", title: "Health Benefits", value: vegetable.healthBenefits.isEmpty ? "N/A" : vegetable.healthBenefits)
                
                Divider()
                SectionHeader(title: "Growing tips")
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Text(vegetable.growingDescription)
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineSpacing(4)
                
            }
           
            
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                    isSelected = true
                }label: {
                    Image(systemName: "plus")
                        .foregroundColor(.green)
                        .font(.title2)
                }
            }
        })
        .sheet(isPresented: $isSelected, content: {
            
        })
        .navigationTitle(vegetable.name)
        .padding()
    }
}

struct SectionHeader: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundColor(.secondary)
            .padding(.top)
    }
}

struct DetailRow: View {
    
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .foregroundColor(.green)
                .frame(width: 24, height: 24)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(value)
                    .font(.body)
                    .foregroundColor(.primary)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    VegetableDetailScreen(vegetable: PreviewData.loadVegetables()[2])
}


