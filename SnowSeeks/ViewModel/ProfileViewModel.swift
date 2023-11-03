//
//  ProfileViewModel.swift
//  SnowSeeks
//
//  Created by Isaque da Silva on 03/11/23.
//

import Foundation

extension ProfileView {
    class ProfileViewModel: ObservableObject {
        let manager = UserManager.shared
        
        @Published var user: User?
        @Published var username = ""
        @Published var profileState: ProfileStates = .nonCreated
        
        func getUser() {
            Task { @MainActor in
                await manager.fetchUser()
                guard let user = await manager.user.first else { return }
                self.user = user
                
                if self.user != nil {
                    self.profileState = .created
                } else {
                    self.profileState = .nonCreated
                }
            }
        }
        
        func createProfile() {
            Task { @MainActor in
                await manager.createUser(username)
                self.username = ""
                getUser()
            }
        }
        
        func deleteUser() {
            Task {
                await manager.deleteUser()
                getUser()
            }
        }
        
        init() {
            getUser()
        }
    }
}
