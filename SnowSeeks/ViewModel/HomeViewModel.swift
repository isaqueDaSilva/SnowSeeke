//
//  HomeViewModel.swift
//  SnowSeeks
//
//  Created by Isaque da Silva on 03/11/23.
//

import Foundation
import SwiftUI

extension HomeView {
    class HomeViewModel: ObservableObject {
        let manager = UserManager.shared
        
        let resorts: [Resort] = Bundle.main.decode("resorts.json")
        
        @Published var user = [User]()
        @Published var searchText = ""
        @Published var showingProfileView = false
        
        @AppStorage("Filtered") var orderBy: OrderBy = .defaultOrder
        
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
        
        func checkIfUserExist() {
            DispatchQueue.main.async {
                self.manager.fetchUser()
                self.user = self.manager.user
                print("Check Ok")
            }
        }
        
        init() {
            checkIfUserExist()
        }
    }
}
