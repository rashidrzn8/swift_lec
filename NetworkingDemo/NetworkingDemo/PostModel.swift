//
//  PostModel.swift
//  NetworkingDemo
//
//  Created by Rashid Ahamed on 25/10/25.
//

import Foundation

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
