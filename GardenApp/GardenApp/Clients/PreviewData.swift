//
//  PreviewData.swift
//  GardenApp
//
//  Created by Rashid Ahamed on 9/11/25.
//

import Foundation

struct PreviewData{

    
    static func loadVegetables() -> [Vegetable] {
            guard let url = Bundle.main.url(forResource: "vegetables", withExtension: "json") else {
                return []
            }
            
            do {
                let data = try Data(contentsOf: url)
                return try JSONDecoder().decode([Vegetable].self, from: data)
            } catch {
                return []
            }
        }


}
