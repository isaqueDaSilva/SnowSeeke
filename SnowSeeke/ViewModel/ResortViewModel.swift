//
//  ResortViewModel.swift
//  SnowSeeke
//
//  Created by Isaque da Silva on 28/10/23.
//

import Foundation

extension ResortView {
    class ResortViewModel: ObservableObject {
        let resort: Resort
        
        @Published var selectedFacility: Resort.Facility?
        @Published var showingFacility = false
        
        func displayFacilityInformation(facility: Resort.Facility) {
            self.selectedFacility = facility
            self.showingFacility = true
        }
        
        init(resort: Resort) {
            self.resort = resort
        }
    }
}
