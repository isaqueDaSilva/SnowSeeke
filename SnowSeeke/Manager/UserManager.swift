//
//  UserManager.swift
//  SnowSeeke
//
//  Created by Isaque da Silva on 02/11/23.
//

import Foundation
import SwiftData
import SwiftUI

actor UserManager {
    static let shared = UserManager()
    
    let container: ModelContainer
    let context: ModelContext
    
    var user = [User]()
    
    private func save() {
        do {
            try context.save()
            fetchUser()
        } catch let error {
            print("Falied to save Data in SwiftData. Error: \(error)")
        }
    }
    
    func fetchUser() {
        let descriptor = FetchDescriptor<User>()
        
        do {
            user = try context.fetch(descriptor)
        } catch let error {
            print("Falied to fetch data. Error: \(error)")
        }
    }
    
    func createNewUser(username: String) {
        let newUser = User(username: username)
        context.insert(newUser)
        save()
    }
    
    func deleteUser() {
        guard let userIndex = user.first else { return }
        context.delete(userIndex)
        save()
    }
    
    func isAFavoriteResort(_ resort: Resort) -> Bool {
        guard let userIndex = user.first else { return false }

        var isFavorite = false
        
        for favoriteResort in userIndex.favoriteResortList {
            if favoriteResort == resort {
                isFavorite = true
            }
        }
        return isFavorite
    }
    
    func addResortToAFavoriteList(_ resort: Resort) {
        guard let userIndex = user.first else { return }
        guard isAFavoriteResort(resort) == false else { return }
        
        userIndex.favoriteResortList.append(resort)
        save()
    }
    
    func removeResortToAFavoriteList(_ resort: Resort) {
        guard let userIndex = user.first else { return }
        guard let resortIndex = userIndex.favoriteResortList.firstIndex(of: resort) else { return }
        
        userIndex.favoriteResortList.remove(at: resortIndex)
        save()
        
    }
    
    private init() {
        let config = ModelConfiguration(for: User.self)
        self.container = try! ModelContainer(for: User.self, configurations: config)
        self.context = ModelContext(container)
    }
}
