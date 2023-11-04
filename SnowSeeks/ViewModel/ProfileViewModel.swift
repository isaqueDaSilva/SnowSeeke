//
//  ProfileViewModel.swift
//  SnowSeeks
//
//  Created by Isaque da Silva on 03/11/23.
//

import Foundation

@MainActor
class ProfileViewModel: ObservableObject {
    let manager = UserManager.shared
    
    @Published var user = [User]()
    @Published var username = ""
    @Published var profileState: ProfileStates = .nonCreated
    
    func getUser() {
        DispatchQueue.main.async {
            self.manager.fetchUser()
            self.user = self.manager.user
            
            if !self.user.isEmpty {
                self.profileState = .created
            } else {
                self.profileState = .nonCreated
            }
        }
    }
    
    func createProfile() {
        DispatchQueue.main.async {
            self.manager.createUser(self.username)
            self.username = ""
            self.getUser()
        }
    }
    
    func deleteUser() {
        DispatchQueue.main.async {
            self.manager.deleteUser()
            self.getUser()
        }
    }
    
    init() {
        getUser()
    }
}
