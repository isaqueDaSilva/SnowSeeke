//
//  UserManager.swift
//  SnowSeeks
//
//  Created by Isaque da Silva on 03/11/23.
//

import Foundation
import SwiftData

@MainActor
class UserManager {
    static let shared = UserManager()
    
    let container: ModelContainer?
    let context: ModelContext?
    
    var user = [User]()
    
    private func save() {
        do {
            try context?.save()
            fetchUser()
        } catch let error {
            print("Falied to save Data in SwiftData. Error: \(error)")
        }
    }
    
    func fetchUser() {
        let descriptor = FetchDescriptor<User>()
        
        do {
            user = try context?.fetch(descriptor) ?? []
        } catch let error {
            print("Falied to fetch User from SwiftData. Error: \(error)")
        }
    }
    
    func createUser(_ username: String) {
        let newUser = User(username: username)
        context?.insert(newUser)
        save()
    }
    
    func deleteUser() {
        guard let user = user.first else { return }
        context?.delete(user)
        save()
        print("Deletado")
    }
    
    func addToFavoriteList(resort: Resort) {
        guard let user = user.first else { return }
        user.addResortToFavoriteList(resort)
        save()
    }
    
    func removeToFavoriteList(resort: Resort) {
        guard let user = user.first else { return }
        user.removeResortToFavoriteList(resort)
        save()
    }
    
    private init() {
        self.container = try? ModelContainer(for: User.self)
        self.context = container?.mainContext
    }
}
