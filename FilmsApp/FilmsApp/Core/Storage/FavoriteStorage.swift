//
//  FavoriteStorage.swift
//  FilmsApp
//
//  Created by Rashid Ahamed on 1/11/25.
//


import Foundation

protocol FavoriteStorage {
    func load() -> Set<String>
    func save(favoriteIDs: Set<String>)
}