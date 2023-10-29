//
//  HomeViewModel.swift
//  SnowSeeke
//
//  Created by Isaque da Silva on 28/10/23.
//

import Foundation

extension HomeView {
    class HomeViewModel: ObservableObject {
        let resorts: [Resort] = Bundle.main.decode("resorts.json")
        
        @Published var searchText = ""
        
        var filteredResorts: [Resort] {
            if searchText.isEmpty {
                return resorts
            } else {
                return resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText)}
            }
        }
    }
}
