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
    }
}
