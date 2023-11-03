//
//  User.swift
//  SnowSeeks
//
//  Created by Isaque da Silva on 03/11/23.
//

import Foundation
import SwiftData

@Model
class User: Identifiable {
    let id = UUID()
    let username: String
    private var favoritesResort = Set<String>()
    
    func isAFavoriteResort(_ resort: Resort) -> Bool {
        favoritesResort.contains(resort.id)
    }
    
    func addResortToFavoriteList(_ resort: Resort) {
        favoritesResort.insert(resort.id)
    }
    
    func removeResortToFavoriteList(_ resort: Resort) {
        favoritesResort.remove(resort.id)
    }
    
    init(username: String) {
        self.username = username
    }
}
