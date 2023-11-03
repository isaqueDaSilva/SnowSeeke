//
//  ResortViewModel.swift
//  SnowSeeks
//
//  Created by Isaque da Silva on 03/11/23.
//

import Foundation

extension ResortView {
    class ResortViewModel: ObservableObject {
        let manager = UserManager.shared
        
        let resort: Resort
        var onSave: () -> Void
        
        @Published var user: User?
        @Published var selectedFacility: Resort.Facility?
        @Published var showingFacility = false
        @Published var showingAlert = false
        
        var size: String {
            switch resort.size {
            case 1:
                return "Small"
            case 2:
                return "Average"
            default:
                return "Large"
            }
        }
        
        var price: String {
            String(repeating: "$", count: resort.price)
        }
        
        func displayFacilityInformation(facility: Resort.Facility) {
            self.selectedFacility = facility
            self.showingFacility = true
        }
        
        func isAFavoriteResort() -> Bool {
            var isFavorite = false
            
            if let user = user {
                if user.isAFavoriteResort(resort) {
                    isFavorite = true
                } else {
                    isFavorite = false
                }
            }
            
            return isFavorite
        }
        
        func checkIfUserExist() {
            Task { @MainActor in
                await manager.fetchUser()
                guard let user = await manager.user.first else { return }
                self.user = user
            }
        }
        
        func addToFavoriteList() {
            Task { @MainActor in
                await manager.addToFavoriteList(resort: resort)
            }
        }
        
        func removeToFavoriteList() {
            Task { @MainActor in
                await manager.removeToFavoriteList(resort: resort)
            }
        }
        
        init(resort: Resort, onSave: @escaping () -> Void) {
            self.resort = resort
            self.onSave = onSave
            
            checkIfUserExist()
        }
    }
}
