//
//  HomeViewModel.swift
//  SnowSeeke
//
//  Created by Isaque da Silva on 28/10/23.
//

import Foundation
import SwiftUI

extension HomeView {
    class HomeViewModel: ObservableObject {
        let manager = UserManager.shared
        
        let resorts: [Resort] = Bundle.main.decode("resorts.json")
        
        @Published var searchText = ""
        @Published var isAFavorite = false
        @Published var showingProfileView = false
        
        @AppStorage("OrderBy") var orderBy: OrderBy = .defaultOrder
        
        func isAFavoriteResort() {
            resorts.forEach { resort in
                Task {
                    if await manager.isAFavoriteResort(resort) {
                        isAFavorite = true
                    } else {
                        isAFavorite = false
                    }
                }
            }
        }
        
        var filteredResorts: [Resort] {
            if searchText.isEmpty {
                switch orderBy {
                case .defaultOrder:
                    return resorts
                case .alphabeticalOrder:
                    return resorts.sorted { $0.name < $1.name }
                case .countryOrder:
                    return resorts.sorted { $0.country < $1.country }
                }
            } else {
                return resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
            }
        }
    }
}
