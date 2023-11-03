//
//  ProfileViewModel.swift
//  SnowSeeke
//
//  Created by Isaque da Silva on 02/11/23.
//

import Foundation

extension ProfileView {
    class ProfileViewModel: ObservableObject {
        let manager = UserManager.shared
        
        @Published var profileState: ProfileStates = .nonCreated
        @Published var user: User?
        @Published var username = ""
        
        func getUser() {
            Task { @MainActor in
                await manager.fetchUser()
                guard let user = await manager.user.first else { return }
                self.user = user
                
                if self.user != nil {
                    profileState = .created
                } else {
                    profileState = .nonCreated
                }
            }
        }
        
        func createUser() {
            Task { @MainActor in
                await manager.createNewUser(username: username)
                self.username = ""
                getUser()
            }
        }
        
        func deleteUser() {
            Task { @MainActor in
                await manager.deleteUser()
                getUser()
            }
        }
        
        init() {
            getUser()
        }
    }
}
