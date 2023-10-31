//
//  Favorites.swift
//  SnowSeeke
//
//  Created by Isaque da Silva on 31/10/23.
//

import Foundation

class Favorites: ObservableObject {
    private var resorts: Set<String>
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    // adds the resort to our set, updates all views, and saves the change
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
    }
    
    // removes the resort from our set, updates all views, and saves the change
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
    }
    
    init() {
        resorts = []
    }
}
