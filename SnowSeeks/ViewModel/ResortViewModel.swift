//
//  ResortViewModel.swift
//  SnowSeeks
//
//  Created by Isaque da Silva on 03/11/23.
//

import Foundation

class ResortViewModel: ObservableObject {
    let manager = UserManager.shared
    
    let resort: Resort
    var onSave: () -> Void
    
    @Published var user = [User]()
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
        
        if !user.isEmpty {
            for userIndex in user {
                if userIndex.isAFavoriteResort(resort) {
                    isFavorite = true
                } else {
                    isFavorite = false
                }
            }
        }
        
        return isFavorite
    }
    
    func checkIfUserExist() {
        DispatchQueue.main.async {
            self.manager.fetchUser()
            self.user = self.manager.user
        }
    }
    
    func addToFavoriteList() {
        DispatchQueue.main.async {
            if !self.user.isEmpty {
                self.manager.addToFavoriteList(resort: self.resort)
            } else {
                self.showingAlert = true
            }
        }
    }
    
    func removeToFavoriteList() {
        DispatchQueue.main.async {
            self.manager.removeToFavoriteList(resort: self.resort)
        }
    }
    
    init(resort: Resort, onSave: @escaping () -> Void) {
        self.resort = resort
        self.onSave = onSave
        
        checkIfUserExist()
    }
}
