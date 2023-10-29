//
//  SkiDetailsViewModel.swift
//  SnowSeeke
//
//  Created by Isaque da Silva on 28/10/23.
//

import Foundation

extension SkiDetailsView {
    class SkiDetailsViewModel: ObservableObject {
        let resort: Resort
        
        init(resort: Resort) {
            self.resort = resort
        }
    }
}
