//
//  Favorites.swift
//  SnowSeeke
//
//  Created by Isaque da Silva on 01/11/23.
//

import Foundation

class Favorites: ObservableObject {
    private var resorts: Set<String>
    
    private let saveKey = "Favorites"

    // returns true if our set contains this resort
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }

    // adds the resort to our set, updates all views, and saves the change
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }

    // removes the resort from our set, updates all views, and saves the change
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }

    func save() {
        // write out our data
    }
    
    private init() {
        resorts = []
    }
}
