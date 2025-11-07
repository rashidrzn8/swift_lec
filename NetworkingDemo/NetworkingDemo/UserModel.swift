//
//  UserModel.swift
//  NetworkingDemo
//
//  Created by Rashid Ahamed on 25/10/25.
//

import Foundation

struct UserModel: Identifiable,Decodable {
    let id: String = UUID().uuidString
    let name: String
    let email: String
}
