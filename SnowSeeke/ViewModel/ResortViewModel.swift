//
//  ResortViewModel.swift
//  SnowSeeke
//
//  Created by Isaque da Silva on 28/10/23.
//

import Foundation

extension ResortView {
    class ResortViewModel: ObservableObject {
        let manager = UserManager.shared
        
        let resort: Resort
        var onSave: () -> Void
        
        @Published var selectedFacility: Resort.Facility?
        @Published var showingFacility = false
        @Published var isAFavorite = false
        @Published var showingAlert = false
        
        func displayFacilityInformation(facility: Resort.Facility) {
            self.selectedFacility = facility
            self.showingFacility = true
        }
        
        func addResortToFavoriteList() {
            Task { @MainActor in
                guard await !manager.user.isEmpty else {
                    showingAlert = true
                    return
                }
                
                await manager.addResortToAFavoriteList(resort)
                self.isAFavorite = true
                onSave()
            }
        }
        
        func removeResortToFavoriteList() {
            Task { @MainActor in
                await manager.removeResortToAFavoriteList(resort)
                self.isAFavorite = false
                onSave()
            }
        }
        
        init(resort: Resort, onSave: @escaping () -> Void) {
            self.resort = resort
            self.onSave = onSave
        }
    }
}
