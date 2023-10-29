//
//  ResortDetailsViewModel.swift
//  SnowSeeke
//
//  Created by Isaque da Silva on 28/10/23.
//

import Foundation

extension ResortDetailsView {
    class ResortDetailsViewModel: ObservableObject {
        let resort: Resort
        
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
        init(resort: Resort) {
            self.resort = resort
        }
    }
}
